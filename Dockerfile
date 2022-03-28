### Imagem base utilizada.
FROM node:14.17.5

### Descrição do autor.
LABEL Author="Talles Alencar" Email="tallesemmanuelspfc@gmail.com" 

### Diretório padrão de trabalho dentro do container.
WORKDIR /app

### Copiando arquivos para serem instalados.
COPY src/package*.json ./

### Instalando pacotes e dependências.
RUN npm install

### Copiando projeto.
COPY src/ .

### Expondo porta 8080.
EXPOSE 8080

### Principal processo de execução do container.
CMD [ "node", "server.js" ]