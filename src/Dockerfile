ARG TAG=latest
FROM node:$TAG
# set working directory
RUN mkdir /app
WORKDIR /app

COPY package*.json ./
RUN npm install

# add app
COPY . .
EXPOSE 8080
CMD ["node", "server.js"] 