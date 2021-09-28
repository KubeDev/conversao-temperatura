FROM node
WORKDIR /app
COPY PACKAGE.JSON ./
RUN npm install 
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]
