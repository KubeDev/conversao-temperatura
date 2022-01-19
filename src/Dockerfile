FROM node:14.17.6

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]

# create image: docker image build -t ricardolopes1/conversao-temperatura:v1 .