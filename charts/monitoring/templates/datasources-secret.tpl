apiVersion: v1
kind: Secret
metadata:
  name: {{ $.Values.grafana.datasources.secretName }}
  namespace: monitoring
type: Opaque
data:
  datasources.yml: |-
    {{ .Files.Get "datasources/prometheus.yaml" | b64enc }}
