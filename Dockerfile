FROM node:14.17.5
ENV NODE_ENV production
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app
COPY --chown=node:node ./src/package*.json ./
RUN npm ci --only=production && npm cache clean --force
COPY --chown=node:node ./src/ ./
USER node
EXPOSE 8080
ENTRYPOINT ["node", "server.js"]
