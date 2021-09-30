FROM node:16.10.0
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
ENTRYPOINT ["node","server.js"]
