FROM node:18.11.0
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . . 
CMD ["node", "server.js"]