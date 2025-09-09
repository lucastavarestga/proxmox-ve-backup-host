#!/bin/bash
# Resumo: Este script automatiza o backup das configurações críticas de um nó Proxmox VE.
# Ele coleta arquivos de configuração importantes, lista de pacotes e status de VMs,
# compacta tudo em um arquivo .tar.gz, gera um checksum e remove backups antigos.
# Autor: Lucas Tavares
# Email: lucas@fkmais.com.br
# Versao: v1.2 - 08-09-2025

set -euo pipefail

# --- CONFIGURAÇÕES ---
DIR_BK="/backup/backups_proxmox/config_backups"
DIAS_RETENCAO="30"
DATA_HOJE="$(date +'%Y-%m-%d')" # pasta continua só com a data
HORA_AGORA="$(date +'%H-%M-%S')" # hora, minuto e segundo para o arquivo
PASTA_DIA="$DIR_BK/$DATA_HOJE"
mkdir -p "$PASTA_DIA"

ARQ_BK_CONF="$PASTA_DIA/proxmox-config-$DATA_HOJE"_"$HORA_AGORA.tar.gz"
LOGFILE="/var/log/proxmox-backup-config.log"

exec >>"$LOGFILE" 2>&1

echo "[$(date)] Iniciando backup de configurações do Proxmox..."

# --- GERAR LISTA DE PACOTES ---
dpkg --get-selections > "$PASTA_DIA/pacotes-apt.list"

# --- LISTAR VERSOES SERVICOS PVE ---
/usr/bin/pveversion -v > "$PASTA_DIA/pveversion.txt"

# --- VMS LIGADAS E DESLIGADAS ---
/usr/sbin/qm list | grep running > "$PASTA_DIA/qm_list_running-$DATA_HOJE"_"$HORA_AGORA.txt"
/usr/sbin/qm list | grep stopped > "$PASTA_DIA/qm_list_stopped-$DATA_HOJE"_"$HORA_AGORA.txt"

# --- LISTA DE ARQUIVOS/DIRETÓRIOS IMPORTANTES ---
FILES_TO_BACKUP=(
   /etc/apt
   /etc/fstab
   /etc/hosts
   /etc/network/interfaces
   /etc/pve
   /etc/ssh
   /etc/iptables
   /etc/postfix
   /etc/sysctl.conf
   /etc/sysctl.d
   /etc/systemd/system
   /root
   "$PASTA_DIA/pacotes-apt.list"
)

# --- FILTRAR APENAS OS QUE EXISTEM ---
EXISTING_FILES=()
for f in "${FILES_TO_BACKUP[@]}"; do
   [ -e "$f" ] && EXISTING_FILES+=("$f")
done

# --- COMPACTAR CONFIGURAÇÕES ---
tar -zcf "$ARQ_BK_CONF" --ignore-failed-read "${EXISTING_FILES[@]}"

# --- GERAR CHECKSUM ---
sha256sum "$ARQ_BK_CONF" > "$ARQ_BK_CONF.sha256"

echo "[$(date)] Backup concluído: $ARQ_BK_CONF"

# --- LIMPEZA ---
find "$DIR_BK" -type d -mtime +$DIAS_RETENCAO -exec rm -rf {} +
echo "[$(date)] Backups antigos removidos (retidos $DIAS_RETENCAO dias)."
echo "[$(date)] Script finalizado com sucesso."
