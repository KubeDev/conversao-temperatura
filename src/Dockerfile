FROM node:14.17.5

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
# a porta que a aplicacao esta ouvindo
EXPOSE 8080

# comando de inicializacao do container
CMD ["node","server.js"]
