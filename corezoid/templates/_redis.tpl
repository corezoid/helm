## Redis helper

{{/*
Create a default fully qualified redis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "corezoid.redis.fullname" -}}
{{- $name := default "redis" .Values.externalRedis.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Redis(TM) hostname
*/}}
{{- define "corezoid.redis.host" -}}
  {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}

{{- define "corezoid.redisCache.host" -}}
  {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}

{{- define "corezoid.redisTimers.host" -}}
  {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}

{{- define "corezoid.redis.port" -}}
  {{- .Values.externalRedis.port -}}
{{- end -}}

{{- define "corezoid.redisCache.port" -}}
  {{- .Values.externalRedis.port -}}
{{- end -}}

{{- define "corezoid.redisTimers.port" -}}
  {{- .Values.externalRedis.port -}}
{{- end -}}

{{/*
Return true if a secret object for Redis(TM) should be created
*/}}
{{- define "corezoid.redis.createSecret" -}}
{{- if and (not .Values.externalRedis.existingSecret) .Values.externalRedis.password }}
  {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return whether Redis(TM) uses password authentication or not
*/}}

{{- define "corezoid.redis.auth.enabled" -}}
{{- if or .Values.externalRedis.password .Values.externalRedis.existingSecret }}
  {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the Redis(TM) secret name
*/}}
{{- define "corezoid.redis.secretName" -}}
{{- if .Values.externalRedis.existingSecret }}
    {{- printf "%s" .Values.externalRedis.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "corezoid.redis.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Redis(TM) secret key
*/}}
{{- define "corezoid.redis.secretPasswordKey" -}}
{{- if .Values.externalRedis.existingSecret }}
    {{- .Values.externalRedis.existingSecretPasswordKey | printf "%s" }}
{{- else -}}
    {{- printf "redis-password" -}}
{{- end -}}
{{- end -}}

{{- define "corezoid.redis.rawPassword" -}}
  {{- .Values.externalRedis.password -}}
{{- end -}}

{{- define "corezoid.redis.host2" -}}
  {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}