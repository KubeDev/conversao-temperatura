# 🐳 Desafio 01 - Docker

# ⚓ Desafio 02 - Kubernetes

## conversao-temperatura

Adiconado multistage build com docker
``` sh
docker image build -t diogoferreira/conversao-temperatura:v1 .
```

``` sh
docker container run -d -p 8080:8080 --name app-conversao-temperatura diogoferreira/conversao-temperatura:v1
```

``` sh
docker container rm -f "CONTAINER ID"
```