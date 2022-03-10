apiVersion: v1
kind: Secret
metadata:
  name: {{ .Release.Name }}
type: Opaque
data:
  password: {{ .Values.grafana.admin.password | b64enc }}
  user: {{ .Values.grafana.admin.user | b64enc }}