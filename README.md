# Script de Backup - Host - Proxmox VE
Este repositório contém um script script_bkp_host_pve.sh para executar o backup de arquivos úteis do Proxmox VE.

Seguem as instruções para download e uso do script.

1. Baixar o Arquivo
Para baixar o arquivo script_bkp_host_pve.sh, você pode usar o curl ou o wget diretamente do terminal:

- Usando curl
```
mkdir /root/scripts
cd /root/scripts
curl -O https://raw.githubusercontent.com/lucastavarestga/proxmox-inventario-pve/main/inventario_proxmox_ve.sh
```

- Ou usando wget
```
mkdir /root/scripts
cd /root/scripts
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-inventario-pve/main/inventario_proxmox_ve.sh
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
wget https://raw.githubusercontent.com/lucastavarestga/proxmox-inventario-pve/main/inventario_proxmox_ve.sh
nano /root/scripts/script_bkp_host_pve.sh
```

5. Resumo
O relatório gerado incluirá:

Informações do sistema e do Proxmox VE
Informações sobre discos e armazenamento (incluindo configuração de LVM e ZFS)
Informações de rede
Detalhes sobre máquinas virtuais e containers LXC
Status dos serviços do Proxmox e informações de cluster
Informações de usuários e autenticação
Registro de auditoria e logs

Para qualquer dúvida ou contato, você pode me encontrar em 

### Qualquer dúvida, entre em contato.

<a href="mailto:lucastavarestga@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
<a href="https://www.linkedin.com/in/lucastavarestga" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"></a>
<a href="https://youtube.com/@lucastavaressoares" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>

Youtube MasterMindTI

<a href="https://www.youtube.com/@mastermindti" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>
