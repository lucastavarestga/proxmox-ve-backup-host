# Script de Backup - Host - Proxmox VE
Este script em Bash automatiza o backup das configurações essenciais de um nó Proxmox VE. Ele foca nos arquivos de sistema e metadados que são cruciais para a reconstrução do ambiente em caso de falha ou modificação mal sucesdida.

Seguem as instruções para download e uso do script.

1. Baixar o Arquivo
Para baixar o arquivo script_bkp_host_pve.sh, você pode usar o curl ou o wget diretamente do terminal:

- Usando curl
```
mkdir /root/scripts
cd /root/scripts
curl -O https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh
```

- Ou usando wget
```
mkdir /root/scripts
cd /root/scripts
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh```
- Ou usando wget
```

2. Definir Permissões
Setando as permissõs:

```
chmod +x /root/scripts/script_bkp_host_pve.sh
```

3. Executar o Script
Para executar o script recebendo informações detalhadas, utilize o seguinte comando:

```
bash -x /root/scripts/script_bkp_host_pve.sh
```

ou 

```
bash /root/scripts/script_bkp_host_pve.sh
```

4. Verificando log do backup gerado:
```
tail -f /var/log/proxmox-backup-config.log
```

Agilizando a vida, baixando arquivo, setando permissão, executando :

```
mkdir /root/scripts
cd /root/scripts
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-ve-backup-host/refs/heads/main/script_bkp_host_pve.sh
nano /root/scripts/script_bkp_host_pve.sh
```

5. Agendamento, para isso usaremos o comando "crontab -e":

```
crontab -e
```

6. Adicione a linha abaixo, salve e saia:
```
# Backup configs  
45 23 * * * /usr/bin/bash /root/scripts/script_bkp_host_pve.sh 
45 11 * * * /usr/bin/bash /root/scripts/script_bkp_host_pve.sh
```

7. Resumo 📝

O backup inclui:

  Lista dos pacotes APT instalados (dpkg --get-selections).
  Versões dos pacotes do Proxmox VE (pveversion).
  Lista das VMs em execução e parados (qm list).
  Arquivos de configuração do /etc/pve e de rede.
  Configurações de sistema, como fstab, sysctl, e ssh.
  Arquivo de log para rastreamento das operações.

O script compacta todos esses arquivos em um único tarball (.tar.gz), gera um checksum SHA256 para verificação de integridade e mantém os backups por 30 dias, realizando a limpeza automática dos arquivos mais antigos.

### Qualquer dúvida, entre em contato.

<a href="mailto:lucastavarestga@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
<a href="https://www.linkedin.com/in/lucastavarestga" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"></a>
<a href="https://youtube.com/@lucastavaressoares" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>
<a href="https://youtube.com/@osysadmin" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>

Youtube MasterMindTI

<a href="https://www.youtube.com/@mastermindti" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>
