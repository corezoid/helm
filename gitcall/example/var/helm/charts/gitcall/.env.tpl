{{- if .global.postgresql.gitcall }}
GITCALL_POSTGRESQL_HOST={{ .global.postgresql.worker.host }}
GITCALL_POSTGRESQL_PORT={{ .global.postgresql.worker.port }}
GITCALL_POSTGRESQL_USERNAME={{ .global.postgresql.worker.username }}
GITCALL_POSTGRESQL_PASSWORD={{ .global.postgresql.worker.password }}
{{- else if .global.postgresql.main }}
GITCALL_POSTGRESQL_HOST={{ .global.postgresql.main.host }}
GITCALL_POSTGRESQL_PORT={{ .global.postgresql.main.port }}
GITCALL_POSTGRESQL_USERNAME={{ .global.postgresql.main.username }}
GITCALL_POSTGRESQL_PASSWORD={{ .global.postgresql.main.password }}
{{- end }}
{{- if .global.rabbitmq.gitcall }}
GITCALL_RABBITMQ_HOST={{ .global.rabbitmq.gitcall.host }}
GITCALL_RABBITMQ_PORT={{ .global.rabbitmq.gitcall.port }}
GITCALL_RABBITMQ_USERNAME={{ .global.rabbitmq.gitcall.username }}
GITCALL_RABBITMQ_PASSWORD={{ .global.rabbitmq.gitcall.password }}
GITCALL_RABBITMQ_VHOST={{ .global.rabbitmq.gitcall.vhost }}
{{- else if .global.rabbitmq.main }}
GITCALL_RABBITMQ_HOST={{ .global.rabbitmq.main.host }}
GITCALL_RABBITMQ_PORT={{ .global.rabbitmq.main.port }}
GITCALL_RABBITMQ_USERNAME={{ .global.rabbitmq.main.username }}
GITCALL_RABBITMQ_PASSWORD={{ .global.rabbitmq.main.password }}
GITCALL_RABBITMQ_VHOST={{ .global.rabbitmq.main.vhost }}
{{- end }}
{{- if .global.rabbitmq.dundergitcall_task  }}
DUNDERGITCALL_TASK_RABBITMQ_HOST={{ .global.rabbitmq.dundergitcall_task.host }}
DUNDERGITCALL_TASK_RABBITMQ_PORT={{ .global.rabbitmq.dundergitcall_task.port }}
DUNDERGITCALL_TASK_RABBITMQ_USERNAME={{ .global.rabbitmq.dundergitcall_task.username }}
DUNDERGITCALL_TASK_RABBITMQ_PASSWORD={{ .global.rabbitmq.dundergitcall_task.password }}
DUNDERGITCALL_TASK_RABBITMQ_VHOST={{ .global.rabbitmq.dundergitcall_task.vhost }}
{{- else if .global.rabbitmq.main }}
DUNDERGITCALL_TASK_RABBITMQ_HOST={{ .global.rabbitmq.main.host }}
DUNDERGITCALL_TASK_RABBITMQ_PORT={{ .global.rabbitmq.main.port }}
DUNDERGITCALL_TASK_RABBITMQ_USERNAME={{ .global.rabbitmq.main.username }}
DUNDERGITCALL_TASK_RABBITMQ_PASSWORD={{ .global.rabbitmq.main.password }}
DUNDERGITCALL_TASK_RABBITMQ_VHOST={{ .global.rabbitmq.main.vhost }}
{{- end }}
{{- if .global.rabbitmq.dundergitcall_system }}
DUNDERGITCALL_SYSTEM_RABBITMQ_HOST={{ .global.rabbitmq.dundergitcall_system.host }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PORT={{ .global.rabbitmq.dundergitcall_system.port }}
DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME={{ .global.rabbitmq.dundergitcall_system.username }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD={{ .global.rabbitmq.dundergitcall_system.password }}
DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST={{ .global.rabbitmq.dundergitcall_system.vhost }}
{{- else if .global.rabbitmq.main }}
DUNDERGITCALL_SYSTEM_RABBITMQ_HOST={{ .global.rabbitmq.main.host }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PORT={{ .global.rabbitmq.main.port }}
DUNDERGITCALL_SYSTEM_RABBITMQ_USERNAME={{ .global.rabbitmq.main.username }}
DUNDERGITCALL_SYSTEM_RABBITMQ_PASSWORD={{ .global.rabbitmq.main.password }}
DUNDERGITCALL_SYSTEM_RABBITMQ_VHOST={{ .global.rabbitmq.main.vhost }}
{{- end }}