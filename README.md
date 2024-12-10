Aqui está um exemplo de um arquivo `README.md` que explica o uso dos arquivos `docker-compose.yml` e do script de instalação do agente Zabbix:

```markdown
# Monitoramento com Zabbix usando Docker e Agente Zabbix

Este repositório contém a configuração necessária para implantar o Zabbix usando Docker e um script para instalar o Zabbix Agent2 em máquinas Linux.

## Estrutura do Repositório

- `docker-compose.yml`: Arquivo de configuração do Docker Compose para implantar o Zabbix.
- `install_zabbix_agent.sh`: Script Bash para instalar o Zabbix Agent2 em máquinas Linux.

## Pré-requisitos

- Docker e Docker Compose instalados na máquina onde o Zabbix será executado.
- Acesso SSH às máquinas onde o Zabbix Agent2 será instalado.

## Como Usar

### 1. Executando o Zabbix com Docker

Para iniciar o Zabbix, siga os passos abaixo:

1. Clone o repositório:

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd <NOME_DO_REPOSITORIO>
   ```

2. Execute o Docker Compose:

   ```bash
   docker-compose up -d
   ```

   Isso iniciará o Zabbix Appliance, que estará acessível em `http://localhost` na porta 80 e o servidor Zabbix na porta 10051.

### 2. Instalando o Zabbix Agent2

Para instalar o Zabbix Agent2 em máquinas Linux, siga os passos abaixo:

1. Edite o script `install_zabbix_agent.sh`:
   - Atualize a variável `IP_POOL` com os endereços IP das máquinas onde deseja instalar o agente.
   - Atualize a variável `ZBX_SERVER` com o endereço IP do servidor Zabbix.

2. Torne o script executável:

   ```bash
   chmod +x install_zabbix_agent.sh
   ```

3. Execute o script:

   ```bash
   ./install_zabbix_agent.sh
   ```

   O script irá atualizar o sistema, instalar o Zabbix Agent2 e configurá-lo para apontar para o servidor Zabbix.

## Considerações Finais

Após a instalação, verifique se o Zabbix Agent2 está funcionando corretamente. Você pode gerenciar e monitorar os agentes através da interface web do Zabbix.

Para mais informações sobre como configurar e utilizar o Zabbix, consulte a [documentação oficial do Zabbix](https://www.zabbix.com/documentation/current/manual).

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.
```

### Instruções

- Substitua `<URL_DO_REPOSITORIO>` e `<NOME_DO_REPOSITORIO>` pelos valores corretos do seu repositório.
- Você pode adicionar mais detalhes ou seções conforme necessário, dependendo do seu público-alvo e do nível de detalhe desejado.
