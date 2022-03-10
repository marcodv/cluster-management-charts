apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.grafana.dashboardsProvider.configMapName }}
  namespace: monitoring
data:
  dashboardproviders.yml: |-
{{ .Files.Get "dashboard-providers/default.yaml" | indent 4 }}
