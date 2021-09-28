FROM node:12.10.0
WORKDIR /app

COPY package*.json .
RUN npm install
COPY . .
CMD ["node", "/app/server.js"]