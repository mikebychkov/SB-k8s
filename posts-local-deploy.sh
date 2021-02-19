eval $(minikube docker-env)
export IMG_TAG=latest
mvn -f ../posts/ clean package docker:build
export IMG_TAG=$(date -u "+%Y%m%d%H%M%S")
mvn -f ../posts/ clean package docker:build
kubectl set image deployments/posts-deployment posts=mikebychkov/sb-posts:$IMG_TAG
kubectl get pods
