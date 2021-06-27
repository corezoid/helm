# Corezoid NameSpace
{{- define "corezoid.namespace" -}}
{{- if .Values.global.namespace -}}
    {{ .Values.global.namespace | quote }}
{{- else -}}
    {{ .Release.Namespace | quote }}
{{- end -}}
{{- end -}}

# Corezoid Names
{{- define "corezoid.capi.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.capi.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.confAgentServer.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.confAgentServer.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.http.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.http.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.limits.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.limits.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.merchant.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.merchant.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.mult.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.mult.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.syncapi.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.syncapi.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.usercode.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.usercode.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.websuperadm.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.websuperadm.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.webadm.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.webadm.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.worker.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.worker.image "global" .Values.global) }}
{{- end -}}

## Names
{{- define "corezoid.capi" -}}
{{ include "common.names.name" . }}-{{ .Values.capi.name }}
{{- end -}}

{{- define "corezoid.confAgentServer" -}}
{{ include "common.names.name" . }}-{{ .Values.confAgentServer.name }}
{{- end -}}

{{- define "corezoid.http" -}}
{{ include "common.names.name" . }}-{{ .Values.http.name }}
{{- end -}}

{{- define "corezoid.limits" -}}
{{ include "common.names.name" . }}-{{ .Values.limits.name }}
{{- end -}}

{{- define "corezoid.merchant" -}}
{{ include "common.names.name" . }}-{{ .Values.merchant.name }}
{{- end -}}

{{- define "corezoid.mult" -}}
{{ include "common.names.name" . }}-{{ .Values.mult.name }}
{{- end -}}

{{- define "corezoid.syncapi" -}}
{{ include "common.names.name" . }}-{{ .Values.syncapi.name }}
{{- end -}}

{{- define "corezoid.usercode" -}}
{{ include "common.names.name" . }}-{{ .Values.usercode.name }}
{{- end -}}

{{- define "corezoid.websuperadm" -}}
{{ include "common.names.name" . }}-{{ .Values.websuperadm.name }}
{{- end -}}

{{- define "corezoid.webadm" -}}
{{ include "common.names.name" . }}-{{ .Values.webadm.name }}
{{- end -}}

{{- define "corezoid.worker" -}}
{{ include "common.names.name" . }}-{{ .Values.worker.name }}
{{- end -}}

{{- define "corezoid.labels.standard" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "corezoid.labels.matchLabels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Return anotations for provisoner
*/}}
{{- define "corezoid.provisoner.configmap" -}}
{{- if eq .Values.provisoner "argocd" -}}
argocd.argoproj.io/hook: PreSync
argocd.argoproj.io/sync-wave: "-5"
{{- else -}}
helm.sh/hook: "pre-install, pre-upgrade"
helm.sh/hook-delete-policy: before-hook-creation,post-delete
helm.sh/hook-weight: "-5"
{{- end -}}
{{- end -}}

{{/*
Return anotations for provisoner
*/}}
{{- define "corezoid.provisoner.job" -}}
{{- if eq .Values.provisoner "argocd" -}}
argocd.argoproj.io/hook: PreSync
argocd.argoproj.io/sync-wave: "-4"
{{- else -}}
helm.sh/hook: "pre-install, pre-upgrade"
helm.sh/hook-delete-policy: before-hook-creation,hook-succeeded
helm.sh/hook-weight: "-4"
{{- end -}}
{{- end -}}


{{/*
Return prometeus
*/}}
{{- define "corezoid.prometheus" -}}
{{- if eq .Values.prometheus.scrape "true" -}}
prometheus.io/path: "{{ .Values.prometheus.path }}"
prometheus.io/port: "{{ .Values.prometheus.port }}"
prometheus.io/scrape: "{{ .Values.prometheus.scrape }}"
{{- end -}}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "corezoid.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "corezoid.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.capi.image .Values.usercode.image .Values.websuperadm.image .Values.webadm.image .Values.syncapi.image .Values.confAgentServer.image .Values.http.image .Values.limits.image .Values.mult.image .Values.merchant.image ) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "corezoid.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s-sa" (include "common.names.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Redis
*/}}
Create a default fully qualified redis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "corezoid.redis.fullname" -}}
{{- $name := default "redis" .Values.redis.nameOverride -}}
{{- printf "%s-%s-master" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "corezoid.redis.host" -}}
  {{- .Values.externalRedis.host -}}
{{- end -}}

{{- define "corezoid.redis.port" -}}
  {{- .Values.externalRedis.port | default 6379 -}}
{{- end -}}

{{- define "corezoid.redis.rawPassword" -}}
  {{- .Values.externalRedis.password | default "" -}}
{{- end -}}

{{- define "corezoid.redisCache.host" -}}
  {{- .Values.externalRedis.host_cache -}}
{{- end -}}

{{- define "corezoid.redisCache.port" -}}
  {{- .Values.externalRedis.port_cache | default 6379 -}}
{{- end -}}

{{- define "corezoid.redisCache.rawPassword" -}}
  {{- .Values.externalRedis.password_cache | default "" -}}
{{- end -}}

{{- define "corezoid.redisTimers.host" -}}
  {{- .Values.externalRedis.host_timers -}}
{{- end -}}

{{- define "corezoid.redisTimers.port" -}}
  {{- .Values.externalRedis.port_timers | default 6379 -}}
{{- end -}}

{{- define "corezoid.redisTimers.rawPassword" -}}
  {{- .Values.externalRedis.password_timers | default "" -}}
{{- end -}}