ARG TAG=latest
FROM node:$TAG
#docker build -t brenofernandes/api-conversao:v1 --build-arg TAG="14.17.5" .
#docker container run -d -p 8080:8080 api-conversao:v1
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]