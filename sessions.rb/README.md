# Sessions service on Ruby

I used it to learn Kubernetes

## Build

```bash
docker build -t auth.rb .
docker run -p 4567:4567 auth.rb
```

## Run with docker-compose

1. Run `docker-compose up`
2. Apply `database.sql`

## Run with Minikube

1. Build and push an image to Docker Hub
2. Intall Minikube
3. Run Minikube `minikube start`
4. Apply service and deployment configs, for example, `kubectl apply -f sinatra-deployment.yaml`
5. Open services `minikube service sinatra-auth-service`
6. Check the browser
