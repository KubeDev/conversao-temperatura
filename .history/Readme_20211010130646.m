# Projeto de subir uma aplicação para docker a partir de uma código fonte

*Read this in other languages: [Portugues-Brasil](README.md)

#### Table of Contents

- [Passo-21](#passo-1)
- [Passo-2](#passo-2)
- [Requirements](#requirements)
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

