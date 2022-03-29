FROM node:16-alpine
WORKDIR /app

COPY package*.json ./
RUN yarn install

COPY . .
EXPOSE 8080

CMD [ "node", "server.js" ]

# docker image build -t diogoferreira/app-conversao-temperatura:v1 .
# docker container run -d -p 8080:8080 --name app-conversao-temperatura diogoferreira/conversao-temperatura:v1