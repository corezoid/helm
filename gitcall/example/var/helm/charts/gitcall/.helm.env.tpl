{{- if .global.postgresql.gitcall }}
- name: GITCALL_POSTGRESQL_HOST
  value: {{ .global.postgresql.gitcall.host | quote }}
- name: GITCALL_POSTGRESQL_PORT
  value: {{ .global.postgresql.gitcall.port | quote }}
- name: GITCALL_POSTGRESQL_USERNAME
  value: {{ .global.postgresql.gitcall.username | quote }}
- name: GITCALL_POSTGRESQL_PASSWORD
  value: {{ .global.postgresql.gitcall.password | quote }}
{{- else if .global.postgresql.main }}
- name: GITCALL_POSTGRESQL_HOST
  value: {{ .global.postgresql.main.host | quote }}
- name: GITCALL_POSTGRESQL_PORT
  value: {{ .global.postgresql.main.port | quote }}
- name: GITCALL_POSTGRESQL_USERNAME
  value: {{ .global.postgresql.main.username | quote }}
- name: GITCALL_POSTGRESQL_PASSWORD
  value: {{ .global.postgresql.main.password | quote }}
{{- end }}
{{- if .global.rabbitmq.gitcall }}
- name: GITCALL_RABBITMQ_HOST
  value: {{ .global.rabbitmq.gitcall.host | quote }}
- name: GITCALL_RABBITMQ_PORT
  value: {{ .global.rabbitmq.gitcall.port | quote }}
- name: GITCALL_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.gitcall.username | quote }}
- name: GITCALL_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.gitcall.password | quote }}
- name: GITCALL_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.gitcall.vhost | quote }}
{{- else if .global.rabbitmq.main }}
- name: GITCALL_RABBITMQ_HOST
  value: {{ .global.rabbitmq.main.host | quote }}
- name: GITCALL_RABBITMQ_PORT
  value: {{ .global.rabbitmq.main.port | quote }}
- name: GITCALL_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.main.username | quote }}
- name: GITCALL_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.main.password | quote }}
- name: GITCALL_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.main.vhost | quote }}
{{- end }}
{{- if .global.rabbitmq.dundergitcall_task }}
- name: DUNDERGITCALL_TASK_RABBITMQ_HOST
  value: {{ .global.rabbitmq.dundergitcall_task.host | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PORT
  value: {{ .global.rabbitmq.dundergitcall_task.port | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.dundergitcall_task.username | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.dundergitcall_task.password | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.dundergitcall_task.vhost | quote }}
{{- else if .global.rabbitmq.main }}
- name: DUNDERGITCALL_TASK_RABBITMQ_HOST
  value: {{ .global.rabbitmq.main.host | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PORT
  value: {{ .global.rabbitmq.main.port | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.main.username | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.main.password | quote }}
- name: DUNDERGITCALL_TASK_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.main.vhost | quote }}
{{- end }}
{{- if .global.rabbitmq.dundergitcall_system }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_HOST
  value: {{ .global.rabbitmq.dundergitcall_system.host | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PORT
  value: {{ .global.rabbitmq.dundergitcall_system.port | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.dundergitcall_system.username | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.dundergitcall_system.password | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.dundergitcall_system.vhost | quote }}
{{- else if .global.rabbitmq.main }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_HOST
  value: {{ .global.rabbitmq.main.host | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PORT
  value: {{ .global.rabbitmq.main.port | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME
  value: {{ .global.rabbitmq.main.username | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD
  value: {{ .global.rabbitmq.main.password | quote }}
- name: DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST
  value: {{ .global.rabbitmq.main.vhost | quote }}
{{- end }}