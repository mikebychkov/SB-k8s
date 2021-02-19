eval $(minikube docker-env)
export IMG_TAG=latest
mvn -f ../finder/ clean package docker:build
export IMG_TAG=$(date -u "+%Y%m%d%H%M%S")
mvn -f ../finder/ clean package docker:build
kubectl set image deployments/finder-deployment finder=mikebychkov/sb-finder:$IMG_TAG
kubectl get pods
