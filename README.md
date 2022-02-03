# k8s-noah

a repo that holds all the configuration for the kubernetes orchestration system, to run all the noah applications.


## Setup local environment

[install helm](https://helm.sh/docs/intro/install/)

add all helm repos
```bash
helm repo add traefik https://helm.traefik.io/traefik
helm repo add eks https://aws.github.io/eks-charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```


## Setup of new cluster

when dealing with a fresh cluster install the following helm charts 

```bash
helm install aws-load-balancer-controller ./charts/aws-load-balancer-controller -n kube-system
helm install --set targetgroupbinding.targetGroupARN=<targetGroupARN> traefik ./charts/traefik -n traefik
```
to upgrade them run the following command

```bash
helm upgrade aws-load-balancer-controller ./charts/aws-load-balancer-controller -n kube-system
helm upgrade traefik ./charts/traefik -n traefik
```


## create secrets for development.

when using dvelopment in a local cluster we need to create the secrets manually.

```bash
kubectl create secret generic postgresql-pass \
  --from-literal=postgresql-postgres-password='changepasswordinprod' \
  -n dev

kubectl create secret generic cache-pass \
  --from-literal=cache_url='redis://redis-master:6379/0' \
  -n dev

kubectl create secret generic celery-broker-pass \
  --from-literal=rabbitmq-password='rabbitmppasschangeinprod' \
  --from-literal=broker_url='amqp://django_user:rabbitmppasschangeinprod@rabbitmq:5672' \
  --from-literal=broker_result_url='redis://redis-master:6379/1' \
  -n dev

openssl genrsa -out jwt-key 4096
openssl rsa -in jwt-key -pubout -out jwt-key.pub
kubectl create secret generic jwt-rsa-keys \
    --from-file=key="jwt-key" \
    --from-file=pub="jwt-key.pub" \
    -n dev

rm jwt-key && rm jwt-key.pub
```
