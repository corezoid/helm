{{/*
Common labels
*/}}
{{- define "redis.labels" -}}
{{ include "corezoid.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
{{- end }}

{{/*
Return the proper Redis image name
*/}}
{{- define "redis.image" -}}
{{- $registry := .Values.image.registry -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag -}}
{{- if .Values.global.redis.image -}}
    {{- if .Values.global.redis.image.registry -}}
        {{- $registry = .Values.global.redis.image.registry -}}
    {{- end -}}
    {{- if .Values.global.redis.image.repository -}}
        {{- $repository = .Values.global.redis.image.repository -}}
    {{- end -}}
    {{- if .Values.global.redis.image.tag -}}
        {{- $tag = .Values.global.redis.image.tag -}}
    {{- end -}}
{{- end -}}
{{- printf "%s%s:%s" $registry $repository $tag -}}
{{- end -}}