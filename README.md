# springboot
for changing the port number in local while jenkins is already runnig on same port 8080, change the docker image port number by using the command, docker run -d -p 8083(to which you would like your image has to be exposed ):8080(having conflit with already runnig jenkins port) hello-world-java(container name) ---   docker run -d -p 8083:8080 hello-world-java  , restart container after initializing the new port docker restart <container ID>  , then see whether the port has changed by (docker pa) lists out currently runnig images. now you can access the application at http://localhost:8083 -- (replace localhost with your ip if you using any instances eg. (00.0.00.00).
