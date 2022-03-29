# conversao-temperatura
#### PASSOS PARA CRIAÇÃO DA IMAGEM E EXECUÇÃO DO CONTAINER:
##### **CERTIFIQUE-SE DE TER O DOCKER INSTALADO**
1. abra o terminal;
2. navegue até a pasta src com o comando: "cd src";
3. execute o comando: " docker image build -t < id_docker_registry/nomeaplicacao:<versão> > . " (sem as aspas duplas)
4. após geração da sua imagem, execute o comando: " docker container run -p 8080:8080 <id_docker_registry/nomeaplicacao:<versão> >
5. se não houver problemas poderá executar normalmente a aplicação utilizando o endereço localhost:8080 no seu browser.

**obs:**
para executar o container no modo daemon sem a necessidade de freezar o terminal,adicione o argumento "-d" ao comando "docker container run"
