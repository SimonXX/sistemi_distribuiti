## Build e avvio Container

Per costruire le immagini dei container è possibile eseguire il seguente comando nella root della repository:

`docker-compose up`


Saranno create 3 immagini:

``` shell 
CONTAINER ID   IMAGE                                   COMMAND                  CREATED        STATUS          PORTS                    NAMES
73cd1cfd3986   sistemi_distribuiti-workwise-frontend   "/docker-entrypoint.…"   14 hours ago   Up 22 seconds   0.0.0.0:4200->80/tcp     workwise-frontend
7fb8541b1e22   sistemi_distribuiti-workwise-backend    "java -jar communica…"   14 hours ago   Up 30 seconds   0.0.0.0:8080->8080/tcp   workwise-backend
faa2b1c346b1   postgres:latest                         "docker-entrypoint.s…"   14 hours ago   Up 51 seconds   0.0.0.0:5433->5432/tcp   workwise-db
```


>nel  docker-compose yaml sono specificate le operazioni di configurazione di rete condivisa tra i container e volume di persistenza

I container in esecuzione saranno:

``` shell
REPOSITORY                              TAG       IMAGE ID       CREATED        SIZE
sistemi_distribuiti-workwise-frontend   latest    a2a7fed3521b   14 hours ago   190MB
sistemi_distribuiti-workwise-backend    latest    a66ffca6b469   14 hours ago   359MB
postgres                                latest    f23dc7cd74bd   2 months ago   432MB
```

Sulla porta 4200 sarà possibile collegarsi al frontend 
