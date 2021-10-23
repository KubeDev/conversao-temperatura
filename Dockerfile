FROM node:14.17.5
ENV NODE_ENV production
WORKDIR /app
COPY ./src/package*.json ./
RUN npm ci --only=production && npm cache clean --force
COPY ./src/ ./
EXPOSE 8080
ENTRYPOINT ["node", "server.js"]
