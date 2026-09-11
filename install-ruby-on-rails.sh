#!/bin/bash

# 1. Instalar dependências do sistema
sudo apt update
sudo apt install -y \
        build-essential \
        rustc \
        libssl-dev \
        libyaml-dev \
        zlib1g-dev \
        libgmp-dev \
        git \
        curl \
	ruby-railties

# 2. Instalar o mise
curl https://mise.run | sh

# 3. Configurar o caminho do mise para a sessão atual do script
export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate bash)"

# 4. Instalar e definir o Ruby
mise use -g ruby@3

sudo chown -R $USER:$USER /var/lib/gems /usr/local/bin

# 5. Agora os comandos gem vão funcionar
gem install rails
gem install ruby-lsp

# 6. Adicionar ao bashrc para uso futuro no terminal (opcional, se já não estiver lá)
if ! grep -q 'mise activate' ~/.bashrc; then
  echo 'eval "$($HOME/.local/bin/mise activate bash)"' >> ~/.bashrc
fi

# Verificação final
ruby --version
rails --version
