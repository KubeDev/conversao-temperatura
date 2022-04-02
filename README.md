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

#### PASSOS PARA CRIAÇÃO E EXECUÇÃO DA SUA IMAGEM NO KUBERNETES COM O DEPLOYMENT.YAML **LOCALMENTE**:
##### **CERTIFIQUE-SE DE TER O K3D E O KUBECTL INSTALADO**
1. com o k3d e kubectl instalados crie os clusters  a partir do comando: k3d cluster create  meucluster --agents <n° de agents> --servers <n° de servers> -p <porta que sera utilizada localmente>:<porta que será utilizada pelo seu service>@loadbalancer
2. navegando até a pasta onde o arquivo deployment.yaml se encontra
3. executando o comando: kubectl apply -f deployment.yaml
4. agora o projeto estará rodando no endereço: localhost:<porta que sera utilizada localmente>
###### LINKS DE INSTALÇÃO E PROCEDIMENTOS:
1. [k3d](https://k3d.io/v5.4.1/#installation)
2. [kuberners - kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)


