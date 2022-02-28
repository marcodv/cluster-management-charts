# k8s-noah

a repo that holds all the configuration for the kubernetes orchestration system, to run all the noah applications.


## Setup local environment

[install helm](https://helm.sh/docs/intro/install/)

add all helm repos
```bash
helm repo add traefik https://helm.traefik.io/traefik
helm repo add eks https://aws.github.io/eks-charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```


## Setup of new cluster

when dealing with a fresh cluster install the following helm charts 

```bash
helm upgrade --install aws-load-balancer-controller \
    ./charts/aws-load-balancer-controller \
    -f ./charts/aws-load-balancer-controller/values.${cluster_environment}.yaml \
    -n kube-system

helm upgrade --install external-dns \
    ./charts/external-dns \
    -n kube-system

helm upgrade --install traefik \
    ./charts/traefik \
    -f ./charts/traefik/values.${cluster_environment}.yaml \
    -n traefik

helm upgrade --install monitoring \
    ./charts/monitoring \
    -f ./charts/monitoring/values.${cluster_environment}.yaml \
    -n monitoring
```

## Release

To release the charts a cicd pipeline will be triggered.

### Release development

by merging a branch back to main we trigger the pipeline to deploy

### Release production

by merging a branch back to production we trigger the pipeline to deploy

