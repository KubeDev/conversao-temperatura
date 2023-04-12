FROM node:18.11.0  
#boa prática versionar a aplicação
WORKDIR /app
COPY package*.json ./
 #boa prática ao invés de só COPY . . 
RUN npm install 
COPY . . 
EXPOSE 8080
CMD ["node", "server.js"]

