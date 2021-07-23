# Corezoid NameSpace
{{- define "corezoid.namespace" -}}
{{- if .Values.global.namespace -}}
    {{ .Values.global.namespace | quote }}
{{- else -}}
    {{ .Release.Namespace | quote }}
{{- end -}}
{{- end -}}

{{- define "corezoid.images.image" -}}
{{- $registryName := .imageRoot.registry -}}
{{- $repositoryName := .imageRoot.repository -}}
{{- $tag := .imageRoot.tag | toString -}}
{{- if .global }}
    {{- if .global.imageRegistry }}
     {{- $registryName = .global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName }}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
{{- printf "docker-hub.middleware.biz/%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}

# Corezoid Names
{{- define "corezoid.capi.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.capi.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.confAgentServer.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.confAgentServer.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.http.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.http.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.limits.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.limits.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.merchant.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.merchant.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.mult.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.mult.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.syncapi.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.syncapi.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.usercode.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.usercode.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.websuperadm.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.websuperadm.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.webadm.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.webadm.image "global" .Values.global) }}
{{- end -}}

{{- define "corezoid.worker.image" -}}
{{ include "corezoid.images.image" (dict "imageRoot" .Values.worker.image "global" .Values.global) }}
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
  annotations:
    meta.helm.sh/release-name: corezoid-stack
    meta.helm.sh/release-namespace: corezoid-stack


{{- define "corezoid.labels.standard" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ .Chart.Name }}
app.kubernetes.io/name: {{ .Chart.Name }}
{{- end -}}

{{- define "corezoid.labels.matchLabels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ .Chart.Name }}
app.kubernetes.io/name: {{ .Chart.Name }}
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
{{/*helm.sh/hook-delete-policy: before-hook-creation,post-delete*/}}
helm.sh/hook-weight: "-5"
{{- end -}}
{{- end -}}

{{/*
Return anotations for postinstall
*/}}
{{- define "corezoid.provisoner.postinstall" -}}
{{- if eq .Values.provisoner "argocd" -}}
argocd.argoproj.io/hook: PostSync
argocd.argoproj.io/sync-wave: "-5"
{{- else -}}
helm.sh/hook: "post-install,post-upgrade"
helm.sh/hook-delete-policy: hook-succeeded
helm.sh/hook-weight: "-5"
{{- end -}}
{{- end -}}

{{/*
Return anotations for provisoner
*/}}
{{- define "corezoid.provisoner.secrets" -}}
{{- if eq .Values.provisoner "argocd" -}}
argocd.argoproj.io/hook: PreSync
argocd.argoproj.io/sync-wave: "-6"
{{- else -}}
helm.sh/hook: "pre-install, pre-upgrade"
helm.sh/hook-delete-policy: before-hook-creation,post-delete
helm.sh/hook-weight: "-6"
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
{{- if .Values.global -}}
{{- if .Values.global.prometheusScrape -}}
{{- if not .Values.global.prometheusScrape -}}
prometheus.io/path: "/metrics"
prometheus.io/port: 9100
prometheus.io/scrape: true
{{- end -}}
{{- end -}}
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

