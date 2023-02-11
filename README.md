# This project helps developers to start DevOps work.
# I implemented CI/CD and schedule node.js application with Cron JOB and docker-composer from Bitbucket
# In order to build CI/CD and Cron JOB at a same docker container, I used docker compose and docker volume.

**-File Structure**


```yml
        version: '2'
        services:
        web:
            # build: ./node-app
            ports:
            - "8080:8080"
            image: DOCKERHUB/web:${IMAGE_TAG:-latest}
            volumes:
            - shared-volume:/src
        cron:
            # build: ./cron-app
            image: DOCKERHUB/cron:${IMAGE_TAG:-latest}
            volumes:
            - shared-volume:/src
        volumes:
        shared-volume:
```
***create docker volume***

```console
sudo docker volume create --name <volume name>

```
***Running docker image in volume***
```console
sudo docker run -d --rm -v <volume name>:<work dir> <docker image name>
```
```yml
-d : then docker image will running in background
-rm: remove the prior conainer and initialize
-v : using volume
-p : linking local port and docker image port like 80:80
-ti: allow dev to enter cmd 
-it: allow dev to see cmd log
```

