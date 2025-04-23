{{- define "ingress.className" -}}
{{- if .Values.global.ingress.className -}}
ingressClassName: {{ .Values.global.ingress.className }}
{{- end -}}
{{- end -}}

{{- define "corezoid-global.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/proxy-body-size: {{ .Values.global.webadm.clientMaxBodySize | default "16m" }}
{{- if .Values.global.ingress.tls.enabled }}
nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
{{- end }}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
{{- end -}}

{{/*
  Create application name label.
  */}}
{{- define "corezoid.appLabels" -}}
app: {{ .Values.global.product | quote }}
{{- end }}


# redis

## cache
{{- define "redis.host_cache" -}}
{{- .Values.global.redis.secret.data.host_cache | default .Values.global.redis.secret.data.host -}}
{{- end -}}

{{- define "redis.port_cache" -}}
{{- .Values.global.redis.secret.data.port_cache | default .Values.global.redis.secret.data.port -}}
{{- end -}}

{{- define "redis.password_cache" -}}
{{- .Values.global.redis.secret.data.password_cache | default .Values.global.redis.secret.data.password -}}
{{- end -}}

## timers
{{- define "redis.host_timers" -}}
{{- .Values.global.redis.secret.data.host_timers | default .Values.global.redis.secret.data.host -}}
{{- end -}}

{{- define "redis.port_timers" -}}
{{- .Values.global.redis.secret.data.port_timers | default .Values.global.redis.secret.data.port -}}
{{- end -}}

{{- define "redis.password_timers" -}}
{{- .Values.global.redis.secret.data.password_timers | default .Values.global.redis.secret.data.password -}}
{{- end -}}

{{- define "common.imagePullSecrets" -}}
{{- if not (eq .Values.global.repotype "public") }}
imagePullSecrets:
- name: {{ .Values.global.imagePullSecrets.name }}
{{- end }}
{{- end -}}

{{- define "common.labels" -}}
app: {{ .Values.global.product }}
{{- end -}}

{{- define "common.spec.strategy.type" -}}
{{ .Values.global.deploymentStrategy.type }}
{{- end -}}

{{- define "common.ingressName" -}}
{{ .Values.appName }}-{{ .Release.Namespace }}
{{- end -}}

{{- define "common.ingressGitcallName" -}}
{{ .Values.appName }}-gitcall-{{ .Release.Namespace }}
{{- end -}}

{{- define "common.ServiceMonitor.apiVersion" -}}
monitoring.coreos.com/v1
{{- end -}}

{{- define "common.ServiceMonitor.metadata.labes" -}}
simulator.observability/scrape: "true"
{{- end -}}