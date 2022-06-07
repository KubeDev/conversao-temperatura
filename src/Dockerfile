FROM node
WORKDIR /app
COPY packeg.json ./
RUN npm install 
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]
