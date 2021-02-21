eval $(minikube docker-env)
export IMG_TAG=latest
mvn -f ../auth/ clean package docker:build
export IMG_TAG=$(date -u "+%Y%m%d%H%M%S")
mvn -f ../auth/ clean package docker:build
kubectl set image deployments/auth-deployment auth=mikebychkov/sb-auth:$IMG_TAG
kubectl get pods
