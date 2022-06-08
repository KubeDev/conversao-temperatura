FROM node:16.15.1-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE 8080

ENTRYPOINT [ "node", "server.js" ]
