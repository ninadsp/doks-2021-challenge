## Local Setup

* Spin up Kubernetes in Docker on Mac
* Verify Kubernetes is healthy with `kubectl get nodes`
* Get Helm by running an interactive Docker container for [helm-kubectl](https://hub.docker.com/r/dtzar/helm-kubectl/)
* Follow instructions on https://github.com/openfaas/workshop/blob/master/lab1b.md and https://github.com/openfaas/faas-netes/blob/master/chart/openfaas/README.md#2-install-with-helm
* Set up an OpenFaas Helm Repo `helm repo add openfaas https://openfaas.github.io/faas-netes/`
* Create additional, dedicated namespaces in Kubernetes for OpenFaas `kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`
* Fetch Helm chart details `help repo update`
* Deploy Helm chart for OpenFaas:
```
 helm upgrade openfaas --install openfaas/openfaas \
    --namespace openfaas  \
    --set functionNamespace=openfaas-fn \
    --set generateBasicAuth=true
```
* Watch the deployment with `kubectl get pods --all-namespaces -w`
* Wait for `gateway` to be ready `kubectl rollout status -n openfaas deploy/gateway`
* Once the service is ready, switch back to kubectl on local and forward the gateway service's port: `kubectl port-forward svc/gateway -n openfaas 8080:8080`
* Get the OpenFaas Admin password from the Kubernetes Secret store: `kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 -d`
* Head over to the browser and open localhost:8080
* Try to deploy a new function from the store - figlet and nodeinfo
* It works!
