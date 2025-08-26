ENABLE_DEBUG=false


configure:
	docker scan --accept-license --version
build:
	docker build  . -t minha-app
run:
	docker run  minha-app
ls:
	docker container ls -a

create-cluster:
	k3d cluster create

delete-cluster:
	k3d cluster delete

ls-cluster:
	k3d cluster list

get-api-version-resources: #Para saber a versão da Apis 'apiVersion'
	kubectl api-resources

kube-create-forward:
	kubectl port-forward pod/meupod 8080:80

kube-pods-apply:
	kubectl apply -f k8s/pod.yaml

kube-replica-apply:
	kubectl apply -f k8s/replicaset.yaml

kube-delete-pods:
	kubectl delete  -f k8s/pod.yaml

kube-apply-deployment:
	kubectl apply -f k8s/deployment.yaml

kube-deployment-rollback:
	kubectl rollout undo deployment meudeployment