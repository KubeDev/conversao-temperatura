FROM node:16.16.0-alpine as BUILD_IMAGE

# Criar e setar o diretório padrão que será usado
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copiar os arquivos package.json, package-lock.json e yarn.lock
# para o diretório do projeto
COPY package*.json /usr/src/app/
COPY yarn.lock /usr/src/app/

RUN yarn install --production=true --frozen-lockfile && \
    yarn cache clean

FROM node:16.16.0-alpine

# Setar o diretório do projeto
ENV NODE_APP /app

# Criar e setar o diretório padrão que será usado
RUN mkdir -p ${NODE_APP}
WORKDIR ${NODE_APP}

# Copiar os códigos gerados pelo build para o diretório do projeto
COPY --from=BUILD_IMAGE /usr/src/app ${NODE_APP}/

# Copiar todos os arquivos para dentro do diretório do projeto
COPY . ${NODE_APP}/

# Expor a porta de escuta do projeto
EXPOSE 8080

# Iniciando o servidor
CMD ["yarn", "start"]