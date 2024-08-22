#!/bin/bash

check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 não está instalado. Instalando..."
        $2
    else
        echo "$1 já está instalado."
    fi
}

if ! command -v brew &> /dev/null; then
    echo "Homebrew não está instalado. Instalando..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew já está instalado."
fi

brew update

check_command docker "brew install --cask docker"

check_command git "brew install git"

check_command make "brew install make"

check_command openssl "brew install openssl@3"

check_command go "brew install go"

echo "Versões instaladas:"
docker --version
git --version
make --version
openssl version
go version

echo "Ambiente provisionado com sucesso!"