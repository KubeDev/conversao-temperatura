FROM node:14.17.5 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]

FROM alpine:3.14 as final
WORKDIR /app
COPY --from=build /app/ .
CMD ["node", "server.js"]
