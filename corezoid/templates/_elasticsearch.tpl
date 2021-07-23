## elasticsearch helper

{{/*
Create a default fully qualified elasticsearch name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "corezoid.elasticsearch.fullname" -}}
{{- $name := default "elasticsearch" .Values.externalElasticsearch.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Redis(TM) hostname
*/}}
{{- define "corezoid.elasticsearch.host" -}}
  {{- printf "%s" .Values.externalElasticsearch.host -}}
{{- end -}}

{{- define "corezoid.elasticsearch.port" -}}
  {{- .Values.externalElasticsearch.port -}}
{{- end -}}

{{/*
Return true if a secret object for Elasticsearch(TM) should be created
*/}}
{{- define "corezoid.elasticsearch.createSecret" -}}
{{- if and (not .Values.externalElasticsearch.existingSecret) .Values.externalElasticsearch.password }}
  {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return whether Elasticsearch(TM) uses password authentication or not
*/}}

{{- define "corezoid.elasticsearch.auth.enabled" -}}
{{- if or .Values.externalElasticsearch.password .Values.externalElasticsearch.existingSecret }}
  {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the Elasticsearch(TM) secret name
*/}}
{{- define "corezoid.elasticsearch.secretName" -}}
{{- if .Values.externalElasticsearch.existingSecret }}
    {{- printf "%s" .Values.externalElasticsearch.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "corezoid.elasticsearch.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Elasticsearch(TM) secret key
*/}}
{{- define "corezoid.elasticsearch.secretPasswordKey" -}}
{{- if .Values.externalElasticsearch.existingSecret }}
    {{- .Values.externalElasticsearch.existingSecretPasswordKey | printf "%s" }}
{{- else -}}
    {{- printf "elasticsearch-password" -}}
{{- end -}}
{{- end -}}
