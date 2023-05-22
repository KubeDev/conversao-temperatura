<b>Criar a Imagem</b>
1- Acesse cd /conversao-temperatura/src
2- Execute o comando para criar a sua imagem "docker build -t namespace/nomedorepositorio:TAG ."

Ex: docker image build -t fabricioveronez/conversao-temperatura:v1 

<b>Execução do container</b>
1 - Execute docker run -d -p 8080:8080 namespace/nomedorepo:TAG
2 - para acessar a aplicação no navegador digite http://localhost:8080/

Ex: docker container run -d -p 8080:8080 fabricioveronez/conversao-temperatura:v1 