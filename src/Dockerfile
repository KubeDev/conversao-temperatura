FROM node:20.15.0
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
CMD ["node", "server.js"]
EXPOSE 8080
