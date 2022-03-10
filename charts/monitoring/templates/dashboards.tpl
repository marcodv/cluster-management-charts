---
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: "1"
  namespace: monitoring
  name: cluster-resources
data:
  cluster-resources.json: |-
{{ .Files.Get "dashboards/cluster-resources.json" | indent 4 }}

---
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: "1"
  namespace: monitoring
  name: traefik
data:
  traefik.json: |-
{{ .Files.Get "dashboards/traefik.json" | indent 4 }}

---
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: "1"
  namespace: monitoring
  name: rabbitmq
data:
  rabbitmq.json: |-
{{ .Files.Get "dashboards/rabbitmq.json" | indent 4 }}

---
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: "1"
  namespace: monitoring
  name: eks-volumes
data:
  eks-volumes.json: |-
{{ .Files.Get "dashboards/eks-volumes.json" | indent 4 }}