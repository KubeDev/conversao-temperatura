# How to use

Use the Dockerfile in the src folder to build the image <br/>
```docker image build -t <namespace/name:tag> <context location>``` <br/>
And run the container with the folling command<br/>
```docker container run -d -p <port>:8080 <namespace/name:tag>```