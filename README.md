# Deployment Docker image

## Testing

Create container:

```
docker build -t php-deployer-composer-nodejs .
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
docker image build -t svatoplukhastik/php-deployer-composer-nodejs:2.0.0 .
```

Publish to DockerHub (login first):

```
docker login
```

```
docker push svatoplukhastik/php-deployer-composer-nodejs:2.0.0
```
