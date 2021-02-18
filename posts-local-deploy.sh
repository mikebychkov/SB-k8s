export IMG_TAG=$(date -u "+%Y%m%d%H%M%S")
eval $(minikube docker-env)
mvn -f ../finder/ clean package docker:build
kubectl set image deployments/finder-deployment finder=mikebychkov/sb-finder:$IMG_TAG
kubectl get pods
