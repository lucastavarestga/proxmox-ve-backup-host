# Script de Backup de Configurações - Proxmox VE

Este script em **Bash** automatiza o backup das configurações essenciais de um nó **Proxmox VE**, garantindo a preservação de arquivos de sistema e metadados críticos para a **recuperação do ambiente** em caso de falhas ou modificações mal-sucedidas.

---

## 📥 Download do Script

Crie o diretório para armazenar os scripts e faça o download:

**Via `curl`:**

```bash
mkdir -p /root/scripts
cd /root/scripts
curl -O https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh
```

**Via `wget`:**

```bash
mkdir -p /root/scripts
cd /root/scripts
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh
```

---

## 🔑 Definindo Permissões

```bash
chmod +x /root/scripts/script_bkp_host_pve.sh
```

---

## ▶️ Execução do Script

Execute o script com detalhes de depuração:

```bash
bash -x /root/scripts/script_bkp_host_pve.sh
```

Ou de forma simples:

```bash
bash /root/scripts/script_bkp_host_pve.sh
```

---

## 📄 Logs do Backup

O log das execuções é gravado em `/var/log/proxmox-backup-config.log`.
Para monitorar em tempo real:

```bash
tail -f /var/log/proxmox-backup-config.log
```

---

## 🚀 Execução Rápida

Para agilizar:

```bash
mkdir -p /root/scripts
cd /root/scripts
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh
chmod +x /root/scripts/script_bkp_host_pve.sh
```

---

## ⏰ Agendamento com Crontab

Edite o crontab:

```bash
crontab -e
```

Adicione as linhas abaixo para rodar o backup diariamente às **23h45** e **11h45**:

```bash
# Backup de configurações Proxmox VE
45 23 * * * /usr/bin/bash /root/scripts/script_bkp_host_pve.sh
45 11 * * * /usr/bin/bash /root/scripts/script_bkp_host_pve.sh
```

---

## 📝 Conteúdo do Backup

O script inclui:

* Lista de pacotes APT instalados (`dpkg --get-selections`).
* Versões dos pacotes do Proxmox VE (`pveversion`).
* Lista de VMs ativas e inativas (`qm list`).
* Configurações do `/etc/pve` e de rede.
* Arquivos críticos de sistema (fstab, sysctl, ssh, etc).
* Log detalhado de execução.

O backup é compactado em um **tarball (.tar.gz)**, acompanhado de um **checksum SHA256** para verificação de integridade.
Backups mais antigos que **30 dias** são removidos automaticamente.

---

## 📬 Contato e Conexões

Qualquer dúvida, entre em contato:

<a href="mailto:lucastavarestga@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"></a> <a href="https://www.linkedin.com/in/lucastavarestga" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a>

### YouTube 🎥

* [Canal Lucas Tavares](https://youtube.com/@lucastavaressoares)
* [Canal Osysadmin](https://youtube.com/@osysadmin)
* [Canal MasterMindTI](https://www.youtube.com/@mastermindti)
