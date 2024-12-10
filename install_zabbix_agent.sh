#!/bin/bash

# Defina o pool de IPs das máquinas Linux
IP_POOL=("192.168.0.31")  # Apenas o IP especificado

# URL do pacote do Zabbix Agent2
ZBX_AGENT_URL="https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix/zabbix-agent2_7.0.6-1+ubuntu24.04_amd64.deb"

# Endereço do servidor Zabbix
ZBX_SERVER="192.168.0.141"

# Loop através do pool de IPs
for IP in "${IP_POOL[@]}"; do
    echo "Instalando Zabbix Agent2 na máquina: $IP"

    # Executa os comandos remotamente via SSH
    ssh user@$IP << EOF
        # Atualiza o sistema
        echo "Atualizando o sistema..."
        sudo apt-get update || { echo "Falha na atualização"; exit 1; }

        # Instala o pacote wget se não estiver instalado
        echo "Instalando wget..."
        sudo apt-get install -y wget || { echo "Falha na instalação do wget"; exit 1; }

        # Baixa o pacote do Zabbix Agent2
        echo "Baixando o Zabbix Agent2..."
        wget $ZBX_AGENT_URL -O /tmp/zabbix-agent2.deb || { echo "Falha ao baixar o pacote"; exit 1; }

        # Instala o Zabbix Agent2
        echo "Instalando o Zabbix Agent2..."
        sudo dpkg -i /tmp/zabbix-agent2.deb || { echo "Falha na instalação do pacote"; exit 1; }

        # Remove o pacote baixado
        rm /tmp/zabbix-agent2.deb

        # Configura o Zabbix Agent2 para apontar para o servidor Zabbix
        echo "Configurando o Zabbix Agent2..."
        sudo sed -i "s/^Server=127.0.0.1/Server=$ZBX_SERVER/" /etc/zabbix/zabbix_agent2.conf || { echo "Falha na configuração do servidor"; exit 1; }

        # Inicia e habilita o serviço do Zabbix Agent2
        echo "Iniciando o Zabbix Agent2..."
        sudo systemctl start zabbix-agent2 || { echo "Falha ao iniciar o serviço"; exit 1; }
        sudo systemctl enable zabbix-agent2 || { echo "Falha ao habilitar o serviço"; exit 1; }

        echo "Zabbix Agent2 instalado e configurado em $IP"
EOF
done
