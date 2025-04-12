#!/bin/bash

# -----------------------------------------
# ubuntu-lts-upgrade.sh
# Script para atualizar Ubuntu 20.04 LTS para 22.04 LTS
# Criado por: Rarysson 💻
# -----------------------------------------

echo "🧱 Iniciando atualização do Ubuntu 20.04 LTS para 22.04 LTS..."

# Etapa 1: Atualização completa do sistema atual
echo "🔄 Atualizando pacotes atuais..."
sudo apt update && sudo apt upgrade -y          # Atualiza lista de pacotes e instala atualizações disponíveis
sudo apt dist-upgrade -y                        # Faz upgrade de pacotes que mudam dependências
sudo apt autoremove -y                          # Remove pacotes desnecessários

# Etapa 2: Verificar se update-manager-core está instalado (necessário para upgrades de versão)
echo "📦 Instalando update-manager-core..."
sudo apt install update-manager-core -y

# Etapa 3: Garantir que o sistema está configurado para buscar apenas versões LTS
echo "⚙️ Configurando /etc/update-manager/release-upgrades..."
sudo sed -i 's/^Prompt=.*/Prompt=lts/' /etc/update-manager/release-upgrades

# Etapa 4: Reinicialização opcional para aplicar atualizações pendentes
read -p "🚀 Deseja reiniciar o sistema antes de continuar? (s/n): " answer
if [[ "$answer" =~ ^[sS]$ ]]; then
    echo "🔁 Reiniciando... Salve seus trabalhos!"
    sleep 3
    sudo reboot
    exit 0
fi

# Etapa 5: Inicia o processo de upgrade
echo "📈 Iniciando o upgrade para o Ubuntu 22.04 LTS..."
sudo do-release-upgrade

# Etapa 6: Instrução pós-upgrade
echo ""
echo "✅ Após a reinicialização, você pode confirmar a nova versão com o comando:"
echo "   lsb_release -a"
echo ""

echo "🎉 Atualização finalizada com sucesso!"
