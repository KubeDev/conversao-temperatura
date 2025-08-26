# Precisa especificar a versão da imagem - garantindo um controle maior das versões que está sendo usada
FROM node:18.11.0

# Pegar os arquivos locais e colocar dentro da imagem que será criado - criar diretório de trabalho
WORKDIR /app
# Instalar os pacotes do nodejs - fazendo uma cópia dos package para o WORKDIR /app
COPY package*.json ./
# Executar o comando para baixar as dependências
RUN npm install
# Copiar o resto do projeto
COPY . .
# Expor a porta 8080
EXPOSE 8080
# Comando de inicialização do NODE
CMD ["node", "server.js"]
