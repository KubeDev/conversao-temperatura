# Challange 1

This repository is the first challenge of the [Kubernetes initiative](https://iniciativakubernetes.com.br/).

# :hammer: Build image

`$ docker image build -t vschmidt/conversor-temperatura:v1 .`

# :rocket: Run

`$ docker container run -d -p 8080:8080 vschmidt/conversor-temperatura:v1`