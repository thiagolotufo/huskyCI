#!/bin/bash

check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 não está instalado. Instalando..."
        $2
    else
        echo "$1 já está instalado."
    fi
}

sudo apt-get update

check_command docker "sudo apt-get install -y docker.io"

check_command git "sudo apt-get install -y git"

check_command make "sudo apt-get install -y make"

check_command openssl "sudo apt-get install -y openssl"

check_command go "sudo apt-get install -y golang"

echo "Versões instaladas:"
docker --version
git --version
make --version
openssl version
go version

echo "Ambiente provisionado com sucesso!"