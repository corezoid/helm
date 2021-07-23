## rabbitmq helper

{{/*
Create a default fully qualified rabbitmq name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "corezoid.rabbitmq.fullname" -}}
{{- $name := default "rabbitmq" .Values.externalRabbitmq.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the rabbitmq(TM) hostname
*/}}
{{- define "corezoid.rabbitmq.host" -}}
  {{- printf "%s" .Values.externalRabbitmq.host -}}
{{- end -}}

{{- define "corezoid.rabbitmq.port" -}}
  {{- .Values.externalRabbitmq.port -}}
{{- end -}}

{{/*
Return the rabbitmq(TM) username
*/}}
{{- define "corezoid.rabbitmq.username" -}}
  {{- printf "%s" .Values.externalRabbitmq.username -}}
{{- end -}}

{{/*
Return the rabbitmq(TM) hostname
*/}}
{{- define "corezoid.rabbitmq.vhost" -}}
  {{- printf "%s" .Values.externalRabbitmq.vhost -}}
{{- end -}}

{{/*
Return true if a secret object for rabbitmq(TM) should be created
*/}}
{{- define "corezoid.rabbitmq.createSecret" -}}
{{- if and (not .Values.externalRabbitmq.existingPasswordSecret) .Values.externalRabbitmq.password }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return whether rabbitmq(TM) uses password authentication or not
*/}}
{{- define "corezoid.rabbitmq.auth.enabled" -}}
{{- if or .Values.externalRabbitmq.password .Values.externalRabbitmq.existingPasswordSecret }}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Return the rabbitmq(TM) secret name
*/}}
{{- define "corezoid.rabbitmq.secretName" -}}
{{- if .Values.externalRabbitmq.existingSecret }}
    {{- printf "%s" .Values.externalRabbitmq.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "corezoid.rabbitmq.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the rabbitmq(TM) secret key
*/}}
{{- define "corezoid.rabbitmq.secretPasswordKey" -}}
{{- if .Values.externalRabbitmq.existingSecret }}
    {{- .Values.externalRabbitmq.existingSecretPasswordKey | printf "%s" }}
{{- else -}}
    {{- printf "rabbitmq-password" -}}
{{- end -}}
{{- end -}}






