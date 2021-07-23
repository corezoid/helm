{{- if .global.postgresql_credentials.gitcall }}
- name: GITCALL_POSTGRESQL_HOST
  value: {{ .global.postgresql_credentials.gitcall.host | quote }}
- name: GITCALL_POSTGRESQL_PORT
  value: {{ .global.postgresql_credentials.gitcall.port | quote }}
- name: GITCALL_POSTGRESQL_USERNAME
  value: {{ .global.postgresql_credentials.gitcall.username | quote }}
- name: GITCALL_POSTGRESQL_PASSWORD
  value: {{ .global.postgresql_credentials.gitcall.password | quote }}
{{- else if .global.postgresql_credentials.main }}
- name: GITCALL_POSTGRESQL_HOST
  value: {{ .global.postgresql_credentials.main.host | quote }}
- name: GITCALL_POSTGRESQL_PORT
  value: {{ .global.postgresql_credentials.main.port | quote }}
- name: GITCALL_POSTGRESQL_USERNAME
  value: {{ .global.postgresql_credentials.main.username | quote }}
- name: GITCALL_POSTGRESQL_PASSWORD
  value: {{ .global.postgresql_credentials.main.password | quote }}
{{- end }}
{{- if .global.rabbitmq_credentials.gitcall }}
- name: GITCALL_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.gitcall.host | quote }}
- name: GITCALL_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.gitcall.port | quote }}
- name: GITCALL_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.gitcall.username | quote }}
- name: GITCALL_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.gitcall.password | quote }}
- name: GITCALL_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.gitcall.vhost | quote }}
{{- else if .global.rabbitmq_credentials.main }}
- name: GITCALL_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.main.host | quote }}
- name: GITCALL_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.main.port | quote }}
- name: GITCALL_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.main.username | quote }}
- name: GITCALL_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.main.password | quote }}
- name: GITCALL_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.main.vhost | quote }}
{{- end }}
{{- if .global.rabbitmq_credentials.dundergitcall_task }}
- name: DUNDERGITCALL_TASK_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.dundergitcall_task.host | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.dundergitcall_task.port | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.dundergitcall_task.username | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.dundergitcall_task.password | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.dundergitcall_task.vhost | quote }}
{{- else if .global.rabbitmq_credentials.main }}
- name: DUNDERGITCALL_TASK_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.main.host | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.main.port | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.main.username | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.main.password | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.main.vhost | quote }}
{{- end }}
{{- if .global.rabbitmq_credentials.dundergitcall_system }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.dundergitcall_system.host | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.dundergitcall_system.port | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.dundergitcall_system.username | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.dundergitcall_system.password | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.dundergitcall_system.vhost | quote }}
{{- else if .global.rabbitmq_credentials.main }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_HOST
  value: {{ .global.rabbitmq_credentials.main.host | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PORT
  value: {{ .global.rabbitmq_credentials.main.port | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq_credentials.main.username | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq_credentials.main.password | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST
  value: {{ .global.rabbitmq_credentials.main.vhost | quote }}
{{- end }}