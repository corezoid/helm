{{- define "ingress.className" -}}
{{- if .Values.global.ingress.className -}}
ingressClassName: {{ .Values.global.ingress.className }}
{{- end -}}
{{- end -}}

{{- define "corezoid-auth.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
      more_set_headers "Cache-Control: no-cache";
      more_set_headers "Cache-Control: no-store";
      more_set_headers "Strict-Transport-Security: max-age=31536000; includeSubDomains";
      add_header X-Frame-Options "SAMEORIGIN";
      add_header X-Content-Type-Options "nosniff";
      add_header Content-Security-Policy "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self'; frame-ancestors 'self'; form-action 'self'";
{{- end -}}


{{- define "corezoid-root.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
  more_set_headers X-Content-Type-Options "nosniff" always;
  more_set_headers X-Frame-Options "SAMEORIGIN" always;
  more_set_headers "Strict-Transport-Security: max-age=31536000; includeSubDomains";
  more_set_headers "Content-Security-Policy: default-src 'self' blob: data: wss://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://fonts.gstatic.com https://upload.wikimedia.org https://*.google.com/ https://*.google.com.ua/ https://accounts.google.com https://accounts.google.ua https://fonts.googleapis.com https://ajax.googleapis.com https://www.google-analytics.com https://www.youtube-nocookie.com https://www.youtube.com/embed/ https://checkout.stripe.com https://b.stripecdn.com https://q.stripe.com https://www.googletagmanager.com/ https://www.gstatic.com https://stats.g.doubleclick.net 'unsafe-inline' 'unsafe-eval'; frame-ancestors 'self' https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}";
  add_header X-Frame-Options "SAMEORIGIN";
  add_header X-Content-Type-Options nosniff;
  add_header Permissions-Policy "geolocation=(), camera=()";
  add_header 'Referrer-Policy' 'no-referrer-when-downgrade';
{{- end -}}


{{- define "corezoid-api.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
  more_set_headers X-Content-Type-Options "nosniff" always;
  more_set_headers "Cache-Control: no-store, no-cache, must-revalidate";
  more_set_headers "Strict-Transport-Security: max-age=31536000; includeSubDomains";
  add_header X-Frame-Options "SAMEORIGIN";
  add_header Content-Security-Policy "default-src 'self' https://*.gravatar.com https://upload.wikimedia.org https://*.gstatic.com https://www.google.com https://www.google-analytics.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} wss://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/* wss://{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/* 'unsafe-inline'; frame-src 'self' https://*.gravatar.com https://*.google.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}; script-src 'self' https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://*.gravatar.com https://*.gstatic.com https://www.google.com https://www.googletagmanager.com https://ajax.googleapis.com https://www.google-analytics.com 'unsafe-inline' 'unsafe-eval'; connect-src 'self' https://www.google-analytics.com https://stats.g.doubleclick.net wss://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}; img-src 'self' data: https://*.gravatar.com https://upload.wikimedia.org https://www.google.com https://www.google.com.ua https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://www.google-analytics.com  https://*.gstatic.com data:; object-src 'self'; font-src 'self' https://*.gravatar.com https://*.gstatic.com https://www.google.com https://fonts.gstatic.com https://fonts.googleapis.com data:; style-src * blob: 'self' https://*.gravatar.com https://*.gstatic.com https://www.google.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://fonts.gstatic.com https://fonts.googleapis.com 'unsafe-inline';";
{{- end -}}


{{- define "corezoid-api-2.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
  more_set_headers X-Content-Type-Options "nosniff" always;
  more_set_headers "Strict-Transport-Security: max-age=31536000; includeSubDomains";
  add_header Content-Security-Policy "default-src 'self' https://*.gravatar.com https://upload.wikimedia.org https://*.gstatic.com https://www.google.com https://www.google-analytics.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} wss://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/* wss://{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/* 'unsafe-inline'; frame-src 'self' https://*.gravatar.com https://*.google.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}; script-src 'self' https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://*.gravatar.com https://*.gstatic.com https://www.google.com https://www.googletagmanager.com https://ajax.googleapis.com https://www.google-analytics.com 'unsafe-inline' 'unsafe-eval'; connect-src 'self' https://www.google-analytics.com https://stats.g.doubleclick.net wss://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}; img-src 'self' data: https://*.gravatar.com https://upload.wikimedia.org https://www.google.com https://www.google.com.ua https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://www.google-analytics.com  https://*.gstatic.com data:; object-src 'self'; font-src 'self' https://*.gravatar.com https://*.gstatic.com https://www.google.com https://fonts.gstatic.com https://fonts.googleapis.com data:; style-src * blob: 'self' https://*.gravatar.com https://*.gstatic.com https://www.google.com https://*.{{ .Values.global.subdomain}}.{{ .Values.global.domain }} https://fonts.gstatic.com https://fonts.googleapis.com 'unsafe-inline';";
{{- end -}}


{{- define "corezoid-system.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
  more_set_headers X-Content-Type-Options "nosniff" always;
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
  add_header X-Content-Type-Options "nosniff";
{{- end -}}


{{- define "corezoid-user-download.ingressAnnotations" -}}
{{ if .Values.global.ingress.annotations -}}
{{ toYaml .Values.global.ingress.annotations }}
{{ end -}}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/configuration-snippet: |
  more_set_headers X-Content-Type-Options "nosniff" always;
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
