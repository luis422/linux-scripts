#!/bin/bash

# RODAR ANTES:
# chmod +x setup-rust.sh

# Para o script caso ocorra algum erro
set -e

sudo apt install -y \
    curl \
    build-essential \
    libssl-dev \
    pkg-config \
    git

# O rustup é o instalador oficial e gerenciador de versões do Rust (análogo ao dotnet tool / dotnet CLI)
if ! command -v rustup &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # Carrega o ambiente Rust na sessão atual do terminal
    source "$HOME/.cargo/env"
else
    echo "Rustup já está instalado."
fi

# Adicionando ferramentas úteis para desenvolvimento web e PostgreSQL
# cargo-watch: recarrega a aplicação automaticamente ao salvar arquivos (equivalente ao dotnet watch run)
cargo install cargo-watch

# sqlx-cli: ferramenta de migração e checagem de tipos em compile-time para o SQLx
cargo install sqlx-cli --no-default-features --features postgres
