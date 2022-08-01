# Projeto de subir uma aplicação para docker a partir de uma código fonte

*Read this in other languages: [Portugues-Brasil](README.md)

#### Table of Contents

- [Passo-01](#passo-01)
- [Passo-02](#passo-02)
- [Passo-03](#passo-03)
- [Installation](#installation)
- [Next steps](#next-steps)
- [Important notes](#important-notes)
- [Upgrade Libreswan](#upgrade-libreswan)
- [Manage VPN users](#manage-vpn-users)
- [Advanced usage](#advanced-usage)


## Passo-1

Construir o docker file 

FROM node:14.17.5
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]

## Passo-2
Dar o build e construir a imagem docker

docker build -t desafio-1-conversao-temperatura .

## Passo-03 

Enviar projeto para o gith
