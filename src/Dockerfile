ARG TAG=14.17.5
FROM node:$TAG
LABEL dockerfile.mantainer="lucascarmo"
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]