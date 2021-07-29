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
