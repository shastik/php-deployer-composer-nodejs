# Deployment Docker image

## Testing

Create container:

```
docker build --no-cache --platform linux/amd64 -t php-deployer-composer-nodejs .
```

Run container in background:

```
docker run -d php-deployer-composer-nodejs
```

Connect into container:

```
docker exec -it php-deployer-composer-nodejs bash
```

## Publish to DockerHub

Build an image:

```
docker image build --no-cache --platform linux/amd64 -t svatoplukhastik/php-deployer-composer-nodejs:2.3.0 .
```

Check if image is correctly build in `linux/amd64` platform:

```
docker image inspect %imageid%
```

In case of problem with target architecture try to remove old previous images that are build with arm64 with command:

```
docker rmi $(docker images -aq)
```

Publish to DockerHub (login first):

```
docker login
```

```
docker push svatoplukhastik/php-deployer-composer-nodejs:2.3.0
```
