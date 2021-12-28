# Curso Kubedev

Realizado o fork do projeto com objetivo de criar o **Dockerfile** da aplicação em **nodejs** rodando na porta **8080**.

## Comandos utilizados para criar imagem

* Estrutura dos comandos:

```bash
Criar imagem
docker image build -t <Namespace>/<Repositorio>:<tag> .

Publicar no dockerhub
docker push <Namespace>/<Repositorio>:<tag>

Alterar versão nodejs
docker image build -t <Namespace>/<Repositorio>:<tag> --build-arg TAG="<DESIRED_VERSION>"
```

Versão: v1

```bash
docker image build -t lucascarmo/conversao-temperatura:v1 .
docker push lucascarmo/conversao-temperatura:v1
```

Versão: latest

```bash
docker tag lucascarmo/conversao-temperatura:v1 lucascarmo/conversao-temperatura:latest
docker push lucascarmo/conversao-temperatura:latest
```

* Caso queira alterar a versão do nodejs, basta rodar o seguinte comando:

```bash
docker image build -t lucascarmo/conversao-temperatura:v1 --build-arg TAG="latest"
```