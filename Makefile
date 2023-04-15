ENABLE_DEBUG=false


configure:
	docker scan --accept-license --version
build:
	docker build  . -t minha-app
run:
	docker run  minha-app
ls:
	docker container ls -a