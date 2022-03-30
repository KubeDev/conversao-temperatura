ARG TAG=LATEST

FROM node:$TAG

RUN apt update && apt upgrade -y

WORKDIR /app

COPY ./package*.json ./

RUN npm install

COPY . . 

EXPOSE 8080

CMD ["node", "server.js"]