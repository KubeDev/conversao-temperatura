FROM node:18.11.0

WORKDIR /usr/src/app

COPY package*.json .

RUN npm install

COPY . .

EXPOSE 8080

CMD ["node", "server.js"]
