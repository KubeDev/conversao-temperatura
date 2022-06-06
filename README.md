### Projeto conversão de temperatura

## Como iniciar com esse projeto

Download do projeto.

```bash
git clone https://github.com/tallesemmanuel/conversao-temperatura.git
```

Para criação de uma nova imagem.

```bash
docker build -t tallesalencar/conversao-temperatura:v1 .
```

Para criação da tag "latest"

```bash
docker tag tallesalencar/conversao-temperatura:v1 tallesalencar/conversao-temperatura:latest
```

Para visualizar a imagem.

```bash
docker image ls
```

Exemplo de execução do container.

```bash
docker container run -d \
  --name app-conversao-temperatura \
  --restart unless-stopped \
  -p 8080:8080 \
  tallesalencar/conversao-temperatura:latest
```

Para visualização a aplicação. Digite o comando no seu navegador.

```bash
localhost:8080
```

Para ver o status da aplicação pelo log do container.

```bash
docker logs -f app-conversao-temperatura
```

Para realizar o push da sua imagem para o Hubdocker.

```bash
docker push tallesalencar/conversao-temperatura:v1
```

e a latest

```bash
docker push tallesalencar/conversao-temperatura:latest
```

Bom estudo!
