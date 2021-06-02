{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "corezoid.name" -}}
{{- default .Chart.Name .Values.global.product | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "corezoid.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "corezoid.tplValue" -}}
  {{- if typeIs "string" .value }}
    {{- tpl .value .context }}
  {{- else }}
    {{- tpl (.value | toYaml) .context }}
  {{- end }}
{{- end -}}