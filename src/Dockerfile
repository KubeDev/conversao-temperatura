FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
copy . .
EXPOSE 8080
CMD ["node", "server.js"]