# :fire: Introduction

This repository contains the challenges of the [Kubernetes initiative](https://iniciativakubernetes.com.br/).

# Challenge 1

## :hammer: Build image

`$ docker image build -t vinicioschmidt/conversor-temperatura:v1 .`

## :rocket: Run

`$ docker container run -d -p 8080:8080 vinicioschmidt/conversor-temperatura:v1`

# Challenge 2

## :hammer: Create cluster (with k3d)

`$ k3d cluster create mycluster --servers 3 --agents 3 -p "8081:30000@loadbalancer"`

## :rocket: Run application (with kubectl)

`$ kubectl apply -f .\deployment.yaml `