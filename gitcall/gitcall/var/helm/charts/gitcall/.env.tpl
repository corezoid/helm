{{- if .global.postgresql_credentials.gitcall }}
GITCALL_POSTGRESQL_HOST={{ .global.postgresql_credentials.worker.host }}
GITCALL_POSTGRESQL_PORT={{ .global.postgresql_credentials.worker.port }}
GITCALL_POSTGRESQL_USERNAME={{ .global.postgresql_credentials.worker.username }}
GITCALL_POSTGRESQL_PASSWORD={{ .global.postgresql_credentials.worker.password }}
{{- else if .global.postgresql_credentials.main }}
GITCALL_POSTGRESQL_HOST={{ .global.postgresql_credentials.main.host }}
GITCALL_POSTGRESQL_PORT={{ .global.postgresql_credentials.main.port }}
GITCALL_POSTGRESQL_USERNAME={{ .global.postgresql_credentials.main.username }}
GITCALL_POSTGRESQL_PASSWORD={{ .global.postgresql_credentials.main.password }}
{{- end }}
{{- if .global.rabbitmq_credentials.gitcall }}
GITCALL_RABBITMQ_HOST={{ .global.rabbitmq_credentials.gitcall.host }}
GITCALL_RABBITMQ_PORT={{ .global.rabbitmq_credentials.gitcall.port }}
GITCALL_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.gitcall.username }}
GITCALL_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.gitcall.password }}
GITCALL_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.gitcall.vhost }}
{{- else if .global.rabbitmq_credentials.main }}
GITCALL_RABBITMQ_HOST={{ .global.rabbitmq_credentials.main.host }}
GITCALL_RABBITMQ_PORT={{ .global.rabbitmq_credentials.main.port }}
GITCALL_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.main.username }}
GITCALL_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.main.password }}
GITCALL_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.main.vhost }}
{{- end }}
{{- if .global.rabbitmq_credentials.dundergitcall_task  }}
DUNDERGITCALL_TASK_RABBITMQ_HOST={{ .global.rabbitmq_credentials.dundergitcall_task.host }}
DUNDERGITCALL_TASK_RABBITMQ_PORT={{ .global.rabbitmq_credentials.dundergitcall_task.port }}
DUNDERGITCALL_TASK_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.dundergitcall_task.username }}
DUNDERGITCALL_TASK_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.dundergitcall_task.password }}
DUNDERGITCALL_TASK_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.dundergitcall_task.vhost }}
{{- else if .global.rabbitmq_credentials.main }}
DUNDERGITCALL_TASK_RABBITMQ_HOST={{ .global.rabbitmq_credentials.main.host }}
DUNDERGITCALL_TASK_RABBITMQ_PORT={{ .global.rabbitmq_credentials.main.port }}
DUNDERGITCALL_TASK_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.main.username }}
DUNDERGITCALL_TASK_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.main.password }}
DUNDERGITCALL_TASK_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.main.vhost }}
{{- end }}
{{- if .global.rabbitmq_credentials.dundergitcall_system }}
DUNDERGITCALL_SYSTEM_RABBITMQ_HOST={{ .global.rabbitmq_credentials.dundergitcall_system.host }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PORT={{ .global.rabbitmq_credentials.dundergitcall_system.port }}
DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.dundergitcall_system.username }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.dundergitcall_system.password }}
DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.dundergitcall_system.vhost }}
{{- else if .global.rabbitmq_credentials.main }}
DUNDERGITCALL_SYSTEM_RABBITMQ_HOST={{ .global.rabbitmq_credentials.main.host }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PORT={{ .global.rabbitmq_credentials.main.port }}
DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME={{ .global.rabbitmq_credentials.main.username }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD={{ .global.rabbitmq_credentials.main.password }}
DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST={{ .global.rabbitmq_credentials.main.vhost }}
{{- end }}