## postgres helper

{{/*
Return the postgres(TM) hostname
*/}}
{{- define "corezoid.postgres.host" -}}
  {{- printf "%s" .Values.externalPostgresql.postgresqlHost -}}
{{- end -}}

{{- define "corezoid.postgres.port" -}}
  {{- .Values.externalPostgresql.postgresqlPort -}}
{{- end -}}

{{/*
Return the postgres(TM) username
*/}}
{{- define "corezoid.postgres.username" -}}
  {{- printf "%s" .Values.externalPostgresql.postgresqlUsername -}}
{{- end -}}

{{/*
Return the postgres(TM) username
*/}}
{{- define "corezoid.postgres.rootname" -}}
  {{- printf "%s" .Values.externalPostgresql.postgresqlPostgresUsername -}}
{{- end -}}

{{/*
Return the postgres(TM) hostname
*/}}
{{- define "corezoid.postgres.shards" -}}
  {{- printf "%s" .Values.externalPostgresql.shards -}}
{{- end -}}

{{/*
Return true if a secret object for postgres(TM) should be created
*/}}
{{- define "corezoid.postgres.createSecret" -}}
{{- if and (not .Values.externalPostgresql.existingPasswordSecret) (or .Values.externalPostgresql.postgresqlPostgresPassword .Values.externalPostgresql.postgresqlPassword) }}
  {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return whether postgres(TM) uses password authentication or not
*/}}
{{- define "corezoid.postgres.auth.enabled" -}}
{{- if or .Values.externalPostgresql.existingPasswordSecret .Values.externalPostgresql.postgresqlPostgresPassword .Values.externalPostgresql.postgresqlPassword }}
  {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Return the postgres(TM) secret name
*/}}
{{- define "corezoid.postgres.secretName" -}}
{{- if .Values.externalPostgresql.existingSecret }}
    {{- printf "%s" .Values.externalPostgresql.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "corezoid.postgres.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the postgres(TM) secret key
*/}}
{{- define "corezoid.postgres.secretPasswordKey" -}}
{{- if .Values.externalPostgresql.existingSecret }}
    {{- .Values.externalPostgresql.existingSecretPasswordKey | printf "%s" }}
{{- else -}}
    {{- printf "postgres-password" -}}
{{- end -}}
{{- end -}}
