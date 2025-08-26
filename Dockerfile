
FROM node:19.9.0

WORKDIR /usr/src/app
COPY ./src .
RUN npm install
RUN ls -ort
EXPOSE 8080
CMD ["node","server.js"]

