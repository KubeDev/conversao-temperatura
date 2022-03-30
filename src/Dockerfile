FROM node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app/.
EXPOSE 8080
CMD ["node", "server.js"]

