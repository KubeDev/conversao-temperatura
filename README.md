# Conteirizando sua aplicação NodeJS
Neste repositório apresento o resultado do encapsulamento de uma aplicação construída em NodeJS. O arquivo de encapsulamento segue uma configuração básica que pode, ou não, ser a mais adequada para a sua aplicação, mas o principal objetivo deste pequeno projeto é demonstrar a facilidade para a distribuição e execução de uma aplicação em encapsulada em contêiners.
Há diversos benefícios em encapsular uma aplicação em contêiner, mas o principal é a “portabilidade”, já que o contêiner pode ser executado em qualquer maquina que execute, neste caso, o [Docker](https://docs.docker.com/get-docker/), independente do sistema operacional.

## Pré requisitos
Para executar este exemplo, não é necessário instalar o NodeJS em sua maquina, nem qualquer outro software utilizado pela aplicação. Você só precisa ter o [Docker](https://docs.docker.com/get-docker/) instalado em sua maquina.

## Como testar

Para testarmos a aplicação, temos que executar dois passos:
1. [Iniciar um contêiner](#iniciar-container)
2. [Acessar a aplicação](#acessando-app)

<a name="iniciar-container"></a>
### Iniciando o contêiner

Execute o comando abaixo para baixar a imagem e gerar o contêiner.
```bash
docker container run -d --rm \
    --name conversor \
    -p 8080:8080 \
    rogeriostos/conversao-temperatura:latest
```
Para verificar se a criação do contêiner foi bem sucedida, execute o comando abaixo:
```bash
docker container ls
```
Você terá uma resposta semelhante ao texto abaixo:
```bash
CONTAINER ID   IMAGE                                      COMMAND            CREATED         STATUS         PORTS                                       NAMES
988a321e3ce2   rogeriostos/conversao-temperatura:latest   "node server.js"   1 minutes ago   Up 1 minutes   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   conversor
```
<a name="acessando-app"></a>
### Acessando o app
Se o passo 1 foi executado sem problemas, basta acessar a aplicação em sua maquina em [http://localhost:8080](http://localhost:8080 "localhost:8080"), a resposta será uma tela como a que está abaixo:
![Conversor de temperatura](/doc/conversor-de-temperatura.png "Conversor de temperatura")
