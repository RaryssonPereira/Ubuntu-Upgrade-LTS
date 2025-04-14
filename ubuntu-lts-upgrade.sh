#!/bin/bash

# -----------------------------------------
# ubuntu-lts-upgrade.sh
# Script para atualizar Ubuntu 20.04 LTS para 22.04 LTS
# Criado por: Rarysson 💻
# Atualizado com melhorias por ChatGPT 🚀
# -----------------------------------------

LOG_FILE="ubuntu-lts-upgrade.log"

# Função para registro de logs detalhados
log() {
    echo -e "$1"
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Validação inicial para garantir que o script seja executado como root
if [ "$EUID" -ne 0 ]; then
    log "❌ Este script deve ser executado como root. Utilize: sudo ./ubuntu-lts-upgrade.sh"
    exit 1
fi

log "🧱 Iniciando atualização do Ubuntu 20.04 LTS para 22.04 LTS..."

# Verificação da versão atual do sistema operacional
CURRENT_VERSION=$(lsb_release -rs)
if [[ "$CURRENT_VERSION" != "20.04" ]]; then
    log "❌ Sua versão atual é $CURRENT_VERSION. Este script só funciona com o Ubuntu 20.04 LTS."
    exit 1
fi

# Checagem de espaço disponível em disco (mínimo recomendado: 5GB)
AVAILABLE_DISK=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
if (( $(echo "$AVAILABLE_DISK < 5" | bc -l) )); then
    log "⚠️  Espaço em disco disponível inferior a 5GB. Libere espaço antes de continuar."
    exit 1
fi

# Opção para realizar um backup das configurações essenciais antes da atualização
read -p "💾 Deseja fazer um backup das configurações essenciais antes de atualizar? (s/n): " backup
if [[ "$backup" =~ ^[sS]$ ]]; then
    BACKUP_FILE="backup-config-$(date '+%Y%m%d').tar.gz"
    log "📦 Realizando backup em $BACKUP_FILE..."
    tar czf "$BACKUP_FILE" /etc
    log "✅ Backup concluído com sucesso."
fi

# Atualização completa dos pacotes atuais do sistema para garantir compatibilidade
log "🔄 Atualizando pacotes atuais..."
apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

# Instalação do update-manager-core, ferramenta essencial para upgrade do Ubuntu
log "📦 Verificando e instalando update-manager-core..."
apt install update-manager-core -y

# Configuração para garantir que apenas atualizações para versões LTS sejam consideradas
log "⚙️ Configurando release-upgrades para LTS..."
sed -i 's/^Prompt=.*/Prompt=lts/' /etc/update-manager/release-upgrades

# Pergunta ao usuário sobre reinicialização opcional para aplicar todas as atualizações pendentes antes do upgrade
read -p "🚀 Deseja reiniciar o sistema antes de continuar? (s/n): " reboot_answer
if [[ "$reboot_answer" =~ ^[sS]$ ]]; then
    log "🔁 Reiniciando sistema... Salve seus trabalhos!"
    sleep 3
    reboot
    exit 0
fi

# Executa o upgrade para a versão 22.04 LTS do Ubuntu
log "📈 Iniciando o upgrade para Ubuntu 22.04 LTS..."
do-release-upgrade

# Informação pós-upgrade para usuário verificar manualmente a nova versão do sistema
log "✅ Após a reinicialização, confirme a nova versão com o comando: lsb_release -a"

log "🎉 Atualização finalizada com sucesso! Detalhes estão no arquivo $LOG_FILE."
