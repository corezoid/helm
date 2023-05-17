{{/*
Common labels
*/}}
{{- define "redis.labels" -}}
{{ include "corezoid.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
{{- end }}