[![N|Corezoid](https://corezoid.com/static/CorezoidProduct-80991adc0bc80fdda3e177ea20d188e1.png)](https://corezoid.com/)

Corezoid Docs - https://doc.corezoid.com/

Corezoid change log - https://doc.corezoid.com/docs/release-notes

## Installation notes:
- This is a new version of the chart - it contains only the Corezoid. 
- It is important to install the correct versions of dependent applications
- For its work, you will need separately already installed:

Postgresql 9.6 ( in the next releases we will update the version of the dependency )

Redis 3.2 ( in the next releases we will update the version of the dependency )

Elasticsearch 6.7

RabbitMQ > 3.8

- Clone repo,  ``` cd corezoid ``` edit values.yaml and fill in parameters to connect to dependent services 
- Now you can start installing ```kubectl create ns corezoid && helm install corezoid -n corezoid .```



## Upgrading notes:
Updating to a new chart takes place in several stages.
- install a new chart in a separate namespace ( the site name and connection parameters to the dependent services must be identical )
```kubectl create ns corezoid-new && helm install corezoid -n corezoid-new ```
- wait until all pods are Running state
- switch the dns record to the ingress created in the new namespace ( corezoid-new )
- check the functionality of the new version, after which you can delete the old version of the chart



## Enabling Enigma encryption:
- See [ENIGMA.md](ENIGMA.md)

## Parameters

### Global parameters

| Name                      | Description                                     | Value          |
| ------------------------- | ----------------------------------------------- | -------------- |
| `global.imageRegistry`    | Global Docker image registry                    | `nil`          |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `undefined`    |
| `global.pullPolicy`       | Global Docker image Policy                      | `IfNotPresent` |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `gp3`          |
| `global.domain`           | Global domain                                   | `""`           |
| `global.error_log_level`  | Global                                          | `debug`        |
| `global.prometheusScrape` | Global                                          | `true`         |
| `global.namespaceCreate`  | Global                                          | `true`         |


### Common parameters

| Name                  | Description                                                                                            | Value       |
| --------------------- | ------------------------------------------------------------------------------------------------------ | ----------- |
| `prometheus.port`     |                                                                                                        | `9100`      |
| `nameOverride`        | String to partially override common.names.fullname                                                     | `nil`       |
| `fullnameOverride`    | String to fully override common.names.fullname                                                         | `nil`       |
| `commonLabels`        | Labels to add to all deployed objects                                                                  | `undefined` |
| `commonAnnotations`   | Annotations to add to all deployed objects                                                             | `undefined` |
| `extraDeploy`         | Array of extra objects to deploy with the release                                                      | `undefined` |
| `schedulerName`       | custom schedulerName https://kubernetes.io/docs/tasks/extend-kubernetes/configure-multiple-schedulers/ | `""`        |
| `provisoner`          | to define provisoner argocd | helm default: helm                                                       | `""`        |
| `ingress.enabled`     | Enable the creation of an ingress for the Corezoid                                                     | `true`      |
| `ingress.hostname`    | Ingress hostname for the Corezoid ingress                                                              | `nil`       |
| `ingress.annotations` | Annotations for the Corezoid ingress                                                                   | `undefined` |


### CAPI Parameters

| Name                                            | Description                                                                                             | Value                 |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------- |
| `capi.name`                                     |                                                                                                         | `capi`                |
| `capi.subdomain`                                |                                                                                                         | `corezoid`            |
| `capi.image.registry`                           |                                                                                                         | `""`                  |
| `capi.image.repository`                         |                                                                                                         | `public/conveyor_api` |
| `capi.image.tag`                                |                                                                                                         | `7.7.0.1`             |
| `capi.image.pullPolicy`                         |                                                                                                         | `IfNotPresent`        |
| `capi.image.pullSecrets`                        |                                                                                                         | `undefined`           |
| `capi.updateStrategy.type`                      |                                                                                                         | `RollingUpdate`       |
| `capi.terminationGracePeriodSeconds`            | duration in seconds the CAPI pod needs to terminate gracefully. Defaults to 300 seconds.                | `10`                  |
| `capi.prometheusScrape`                         |                                                                                                         | `false`               |
| `capi.replicaCount`                             | Number of CAPI replicas to deploy                                                                       | `2`                   |
| `capi.resources.limits.cpu`                     |                                                                                                         | `2`                   |
| `capi.resources.limits.memory`                  |                                                                                                         | `2Gi`                 |
| `capi.resources.requests.cpu`                   |                                                                                                         | `100m`                |
| `capi.resources.requests.memory`                |                                                                                                         | `100Mi`               |
| `capi.schedulers`                               |                                                                                                         | `1`                   |
| `capi.customLivenessProbe`                      | Custom livenessProbe that overrides the default one                                                     | `undefined`           |
| `capi.customReadinessProbe`                     | Custom readinessProbe that overrides the default one                                                    | `undefined`           |
| `capi.command`                                  | Override default container command (useful when using custom images)                                    | `undefined`           |
| `capi.args`                                     | Override default container args (useful when using custom images)                                       | `undefined`           |
| `capi.hostAliases`                              | https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/ | `undefined`           |
| `capi.podLabels`                                | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/                               | `undefined`           |
| `capi.podAnnotations`                           | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/                          | `undefined`           |
| `capi.podAffinityPreset`                        | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`                | `""`                  |
| `capi.podAntiAffinityPreset`                    | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`           | `soft`                |
| `capi.nodeAffinityPreset.type`                  | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`          | `""`                  |
| `capi.nodeAffinityPreset.key`                   | Node label key to match. Ignored if `capi.affinity` is set                                              | `""`                  |
| `capi.nodeAffinityPreset.values`                | Node label values to match. Ignored if `capi.affinity` is set                                           | `undefined`           |
| `capi.affinity`                                 | Affinity for CAPI pods assignment                                                                       | `undefined`           |
| `capi.nodeSelector`                             | Node labels for CAPI pods assignment                                                                    | `undefined`           |
| `capi.tolerations`                              | Tolerations for CAPI pods assignment                                                                    | `undefined`           |
| `capi.updateStrategy.type`                      | CAPI statefulset strategy type                                                                          | `RollingUpdate`       |
| `capi.priorityClassName`                        | CAPI pods' priorityClassName                                                                            | `""`                  |
| `capi.lifecycleHooks`                           | for the CAPI container(s) to automate configuration before or after startup                             | `undefined`           |
| `capi.extraEnvVars`                             | Array with extra environment variables to add to CAPI nodes                                             | `undefined`           |
| `capi.extraEnvVarsCM`                           | Name of existing ConfigMap containing extra env vars for CAPI nodes                                     | `nil`                 |
| `capi.extraEnvVarsSecret`                       | Name of existing Secret containing extra env vars for CAPI nodes                                        | `nil`                 |
| `capi.extraVolumes`                             | Optionally specify extra list of additional volumes for the CAPI pod(s)                                 | `undefined`           |
| `capi.extraVolumeMounts`                        | Optionally specify extra list of additional volumeMounts for the CAPI container(s)                      | `undefined`           |
| `capi.initContainers`                           | Add additional initContainers containers to the CAPI pod(s)                                             | `undefined`           |
| `capi.service.capiPort`                         | CAPI service port number. Default: 80                                                                   | `80`                  |
| `capi.service.confAgentPort`                    | confAgentPort service port number. Default: 8585                                                        | `8585`                |
| `capi.capi_front_captcha_disabled`              | enable/disable recaptcha on login page                                                                  | `true`                |
| `capi.capi_front_captcha_key`                   | key for works with google recaptcha (page /login if corezoid registration)                              | `""`                  |
| `capi.capi_backend_captcha_key`                 | secret_key works with google recaptcha                                                                  | `""`                  |
| `capi.registration_restriction.enable`          | restricting user registration only within the domains specified below if enabled                        | `false`               |
| `capi.registration_restriction.enable`          | enable or disable restrictions                                                                          | `false`               |
| `capi.registration_restriction.allowed_domains` | allowed domains for registration                                                                        | `undefined`           |
| `capi.max_task_size_for_process_conv`           | max task size for process conv in kb                                                                    | `264000`              |
| `capi.max_task_size_for_st_diagramm_conv`       | max task size for state diagramm conv in kb                                                             | `264000`              |
| `capi.max_reqs_limit`                           | max req/sec of create|modify|delete for conv|folder|dashboard in 1 sec                                  | `50000`               |
| `capi.merchant_api.skip_otp`                    | skip otp when create company                                                                            | `true`                |
| `capi.cookie_expr_time`                         | session expire time, in sec (default 900)                                                               | `7200`                |
| `capi.front_setting.doc_host`                   | documentation url (navigate by clicking on DOCS link)                                                   | `doc.corezoid.com`    |
| `capi.front_setting.doc_index`                  | path for documentation url                                                                              | `/`                   |
| `capi.front_setting.ui.market`                  | enabled Market button                                                                                   | `false`               |
| `capi.front_setting.ui.bot_platform`            | enabled Bot platform  button                                                                            | `false`               |
| `capi.front_setting.ui.billing`                 | enabled billing  button                                                                                 | `false`               |
| `capi.front_setting.ui.git_call`                | enabled git_call button                                                                                 | `false`               |
| `capi.front_setting.ui.default_company`         | set default company name                                                                                | `My Corezoid`         |
| `capi.front_setting.ui.tab_name`                | tab name                                                                                                | `Corezoid`            |
| `capi.front_setting.ui.disabled_auth_logo`      | disable or enable logo on main page                                                                     | `false`               |
| `capi.front_setting.ui.color_main`              | main color in HEX                                                                                       | `#0791e5`             |
| `capi.front_setting.ui.color_logo`              | logo color in HEX                                                                                       | `#0791e5`             |
| `capi.front_setting.ui.color_logo_hover`        | logo_hover color in HEX                                                                                 | `#056cab`             |
| `capi.ldap_server`                              | ldap host                                                                                               | `""`                  |
| `capi.ldap_port`                                | ldap port                                                                                               | `389`                 |
| `capi.ldap_base`                                | ldap base (o=domain)                                                                                    | `""`                  |
| `capi.ldap_filter`                              | filter for ldap query                                                                                   | `""`                  |
| `capi.ldap_first_bind_user`                     | if true - bind_user_name, bind_user_pass should be filled. if it's false it is not necessary            | `true`                |
| `capi.ldap_bind_user_name`                      |                                                                                                         | `""`                  |
| `capi.ldap_bind_user_pass`                      |                                                                                                         | `""`                  |
| `capi.ldap_user_nick_entry`                     |                                                                                                         | `""`                  |
| `capi.ldap_tls`                                 |                                                                                                         | `false`               |
| `capi.logic_settings.api_max_thread`            |                                                                                                         | `50000`               |
| `capi.logic_settings.api_max_thread`            | max allowed threads for api logic                                                                       | `50000`               |
| `capi.logic_settings.sender_max_threads`        | max allowed threads for sender api logic                                                                | `25`                  |
| `capi.logic_settings.timer_default`             |                                                                                                         | `5`                   |
| `capi.enigma_pk_id`                             | enigma private_key_id                                                                                   | `""`                  |


### ConfAgentServer Parameters

| Name                                            | Description                                                                                    | Value                       |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `confAgentServer.name`                          |                                                                                                | `conf-agent-server`         |
| `confAgentServer.image.registry`                |                                                                                                | `docker-hub.middleware.biz` |
| `confAgentServer.image.repository`              |                                                                                                | `public/conf_agent_server`  |
| `confAgentServer.image.tag`                     |                                                                                                | `1.5.1`                     |
| `confAgentServer.image.pullPolicy`              |                                                                                                | `IfNotPresent`              |
| `confAgentServer.image.pullSecrets`             |                                                                                                | `undefined`                 |
| `confAgentServer.replicaCount`                  |                                                                                                | `2`                         |
| `confAgentServer.terminationGracePeriodSeconds` |                                                                                                | `10`                        |
| `confAgentServer.resources.limits.cpu`          |                                                                                                | `2`                         |
| `confAgentServer.resources.limits.memory`       |                                                                                                | `2Gi`                       |
| `confAgentServer.resources.requests.cpu`        |                                                                                                | `100m`                      |
| `confAgentServer.resources.requests.memory`     |                                                                                                | `100Mi`                     |
| `confAgentServer.autoscaling.enabled`           |                                                                                                | `true`                      |
| `confAgentServer.autoscaling.minReplicas`       |                                                                                                | `1`                         |
| `confAgentServer.autoscaling.maxReplicas`       |                                                                                                | `2`                         |
| `confAgentServer.autoscaling.targetCPU`         |                                                                                                | `65`                        |
| `confAgentServer.autoscaling.targetMemory`      |                                                                                                | `80`                        |
| `confAgentServer.autoscaling.requests`          |                                                                                                | `nil`                       |
| `confAgentServer.service.confAgenttPort`        | confAgentServerPort Port default: 80                                                           | `8585`                      |
| `confAgentServer.podAnnotations`                |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`                        | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`                    | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`                  | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`                   | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`                | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                                 | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### http-worker Parameters

| Name                                                             | Description                                                                                      | Value                       |
| ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | --------------------------- |
| `http.name`                                                      |                                                                                                  | `http-worker`               |
| `http.image.registry`                                            |                                                                                                  | `docker-hub.middleware.biz` |
| `http.image.repository`                                          |                                                                                                  | `public/http-worker`        |
| `http.image.tag`                                                 |                                                                                                  | `3.6.0.1`                   |
| `http.image.pullPolicy`                                          |                                                                                                  | `IfNotPresent`              |
| `http.image.pullSecrets`                                         |                                                                                                  | `undefined`                 |
| `http.replicaCount`                                              |                                                                                                  | `1`                         |
| `http.terminationGracePeriodSeconds`                             |                                                                                                  | `40`                        |
| `http.resources.limits.cpu`                                      |                                                                                                  | `2`                         |
| `http.resources.limits.memory`                                   |                                                                                                  | `2Gi`                       |
| `http.resources.requests.cpu`                                    |                                                                                                  | `100m`                      |
| `http.resources.requests.memory`                                 |                                                                                                  | `100Mi`                     |
| `http.autoscaling.enabled`                                       |                                                                                                  | `true`                      |
| `http.autoscaling.minReplicas`                                   |                                                                                                  | `1`                         |
| `http.autoscaling.maxReplicas`                                   |                                                                                                  | `2`                         |
| `http.autoscaling.targetCPU`                                     |                                                                                                  | `65`                        |
| `http.autoscaling.targetMemory`                                  |                                                                                                  | `nil`                       |
| `http.autoscaling.requests`                                      |                                                                                                  | `nil`                       |
| `http.schedulers`                                                |                                                                                                  | `2`                         |
| `http.max_http_resp_size`                                        | maximum response size                                                                            | `5242880`                   |
| `http.blocked_domains`                                           | blacklist for apicall ip or hostname (more - http://erlang.org/doc/man/httpc.html#set_options-2) | `undefined`                 |
| `http.tune.http_consumer_queues_count`                           | queues_count for http_consumer                                                                   | `8`                         |
| `http.tune.http_consumer_connections_per_queue`                  | The specified number of tcp connections will be created for each queue                           | `1`                         |
| `http.tune.http_consumer_channels_per_connection`                | max opened channels per connection for http_consumer                                             | `1`                         |
| `http.tune.http_consumer_messages_prefetch_size_per_channel`     | messages_prefetch_size per channel for http_consumer                                             | `20`                        |
| `http.tune.consumer_settings_messages_prefetch_size_per_channel` | messages_prefetch_size per channel for consumer_settings                                         | `50`                        |
| `http.tune.consumer_response_prefetch_size_per_channel`          | prefetch_size_per_channel for consumer_response                                                  | `50`                        |
| `capi.podAffinityPreset`                                         | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`         | `""`                        |
| `capi.podAntiAffinityPreset`                                     | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`    | `soft`                      |
| `capi.nodeAffinityPreset.type`                                   | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`   | `""`                        |
| `capi.nodeAffinityPreset.key`                                    | Node label key to match. Ignored if `capi.affinity` is set                                       | `""`                        |
| `capi.nodeAffinityPreset.values`                                 | Node label values to match. Ignored if `capi.affinity` is set                                    | `undefined`                 |
| `capi.affinity`                                                  | Affinity for CAPI pods assignment                                                                | `undefined`                 |


### Syncapi Parameters

| Name                             | Description                                                                                    | Value                       |
| -------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `syncapi.name`                   |                                                                                                | `syncapi`                   |
| `syncapi.subdomain`              | subdomain for syncapi like syncapi would be "syncapi.example.com"                              | `syncapi`                   |
| `syncapi.image.registry`         |                                                                                                | `docker-hub.middleware.biz` |
| `syncapi.image.repository`       |                                                                                                | `public/corezoid_api_sync`  |
| `syncapi.image.tag`              |                                                                                                | `2.1.0`                     |
| `syncapi.image.pullSecrets`      |                                                                                                | `undefined`                 |
| `syncapi.replicaCount`           |                                                                                                | `1`                         |
| `syncapi.autoscaling.enabled`    |                                                                                                | `false`                     |
| `syncapi.service.syncapiPort`    | port default: 80                                                                               | `80`                        |
| `syncapi.schedulers`             |                                                                                                | `2`                         |
| `syncapi.podAnnotations`         |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`         | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`     | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`   | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`    | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values` | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                  | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### Webadm Parameters

| Name                               | Description                                                                                    | Value                       |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `webadm.name`                      |                                                                                                | `webadm`                    |
| `webadm.image.registry`            |                                                                                                | `docker-hub.middleware.biz` |
| `webadm.image.repository`          |                                                                                                | `public/conveyor_adm_web`   |
| `webadm.image.tag`                 |                                                                                                | `5.7.0`                     |
| `webadm.image.pullSecrets`         |                                                                                                | `undefined`                 |
| `webadm.replicaCount`              |                                                                                                | `2`                         |
| `webadm.resources.limits.cpu`      |                                                                                                | `200m`                      |
| `webadm.resources.limits.memory`   |                                                                                                | `500Mi`                     |
| `webadm.resources.requests.cpu`    |                                                                                                | `50m`                       |
| `webadm.resources.requests.memory` |                                                                                                | `50Mi`                      |
| `webadm.autoscaling.enabled`       |                                                                                                | `false`                     |
| `webadm.podAnnotations`            |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`           | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`       | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`      | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`   | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                    | Affinity for CAPI pods assignment                                                              | `undefined`                 |
| `webadm.service.port`              | port default: 80                                                                               | `80`                        |


### Web Superadm Parameters

| Name                                    | Description      | Value                       |
| --------------------------------------- | ---------------- | --------------------------- |
| `websuperadm.name`                      |                  | `web-superadm`              |
| `websuperadm.subdomain`                 |                  | `superadm`                  |
| `websuperadm.image.registry`            |                  | `docker-hub.middleware.biz` |
| `websuperadm.image.repository`          |                  | `public/conf_agent_admin`   |
| `websuperadm.image.tag`                 |                  | `1.5.1`                     |
| `websuperadm.image.pullPolicy`          |                  | `IfNotPresent`              |
| `websuperadm.image.pullSecrets`         |                  | `undefined`                 |
| `websuperadm.replicaCount`              |                  | `2`                         |
| `websuperadm.resources.limits.cpu`      |                  | `200m`                      |
| `websuperadm.resources.limits.memory`   |                  | `500Mi`                     |
| `websuperadm.resources.requests.cpu`    |                  | `50m`                       |
| `websuperadm.resources.requests.memory` |                  | `50Mi`                      |
| `websuperadm.autoscaling.enabled`       |                  | `false`                     |
| `websuperadm.service.port`              | port default: 80 | `80`                        |


### Worker Parameters

| Name                               | Description                                                                                    | Value                       |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `worker.name`                      |                                                                                                | `worker`                    |
| `worker.image.registry`            |                                                                                                | `docker-hub.middleware.biz` |
| `worker.image.repository`          |                                                                                                | `public/conveyor-worker`    |
| `worker.image.tag`                 |                                                                                                | `4.7.0.1`                   |
| `worker.image.pullPolicy`          |                                                                                                | `IfNotPresent`              |
| `worker.image.pullSecrets`         |                                                                                                | `undefined`                 |
| `worker.replicaCount`              |                                                                                                | `2`                         |
| `worker.resources.limits.cpu`      |                                                                                                | `1000m`                     |
| `worker.resources.limits.memory`   |                                                                                                | `1500Mi`                    |
| `worker.resources.requests.cpu`    |                                                                                                | `150m`                      |
| `worker.resources.requests.memory` |                                                                                                | `150Mi`                     |
| `worker.autoscaling.enabled`       |                                                                                                | `false`                     |
| `worker.schedulers`                |                                                                                                | `2`                         |
| `worker.podAnnotations`            |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`           | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`       | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`      | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`   | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                    | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### Merchant Parameters

| Name                                 | Description                                                                                    | Value                       |
| ------------------------------------ | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `merchant.name`                      |                                                                                                | `merchant`                  |
| `merchant.image.registry`            |                                                                                                | `docker-hub.middleware.biz` |
| `merchant.image.repository`          |                                                                                                | `public/merchant`           |
| `merchant.image.tag`                 |                                                                                                | `v0.0.27.2`                 |
| `merchant.image.pullPolicy`          |                                                                                                | `IfNotPresent`              |
| `merchant.image.pullSecrets`         |                                                                                                | `undefined`                 |
| `merchant.resources.limits.cpu`      |                                                                                                | `500m`                      |
| `merchant.resources.limits.memory`   |                                                                                                | `800Mi`                     |
| `merchant.resources.requests.cpu`    |                                                                                                | `100m`                      |
| `merchant.resources.requests.memory` |                                                                                                | `100Mi`                     |
| `merchant.autoscaling.enabled`       |                                                                                                | `false`                     |
| `merchant.service.merchantPort`      |                                                                                                | `80`                        |
| `merchant.service.managmentPort`     |                                                                                                | `7980`                      |
| `merchant.merchant_login`            |                                                                                                | `""`                        |
| `merchant.merchant_secret`           |                                                                                                | `""`                        |
| `merchant.podAnnotations`            |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`             | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`         | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`       | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`        | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`     | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                      | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### Limits Parameters

| Name                               | Description                                                                                    | Value                       |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `limits.name`                      |                                                                                                | `limits`                    |
| `limits.image.registry`            |                                                                                                | `docker-hub.middleware.biz` |
| `limits.image.repository`          |                                                                                                | `public/corezoid_limits`    |
| `limits.image.tag`                 |                                                                                                | `1.2.1`                     |
| `limits.image.pullPolicy`          |                                                                                                | `IfNotPresent`              |
| `limits.image.pullSecrets`         |                                                                                                | `undefined`                 |
| `limits.resources.limits.cpu`      |                                                                                                | `500m`                      |
| `limits.resources.limits.memory`   |                                                                                                | `800Mi`                     |
| `limits.resources.requests.cpu`    |                                                                                                | `50m`                       |
| `limits.resources.requests.memory` |                                                                                                | `50Mi`                      |
| `limits.service.limitsPort`        | port default: 80                                                                               | `80`                        |
| `limits.podAnnotations`            |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`           | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`       | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`      | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`   | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                    | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### Mult Parameters

| Name                               | Description                                                                                    | Value                           |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------- |
| `mult.name`                        |                                                                                                | `mult`                          |
| `mult.image.registry`              |                                                                                                | `docker-hub.middleware.biz`     |
| `mult.image.repository`            |                                                                                                | `public/conveyor_api_multipart` |
| `mult.image.tag`                   |                                                                                                | `2.6.0.1`                       |
| `mult.image.pullPolicy`            |                                                                                                | `IfNotPresent`                  |
| `mult.image.pullSecrets`           |                                                                                                | `undefined`                     |
| `mult.resources.limits.cpu`        |                                                                                                | `500m`                          |
| `mult.resources.limits.memory`     |                                                                                                | `800Mi`                         |
| `mult.resources.requests.cpu`      |                                                                                                | `50m`                           |
| `mult.resources.requests.memory`   |                                                                                                | `50Mi`                          |
| `mult.autoscaling.enabled`         |                                                                                                | `false`                         |
| `mult.service.multPort`            | port default: 80                                                                               | `80`                            |
| `mult.persistantVolumeClaimName`   | pvc name if it already exist or was created manualy                                            | `mult-pvc`                      |
| `mult.persistantVolumeClaimCreate` | true if pvc for mult should be created automaticaly, false if you already have pvc             | `true`                          |
| `mult.enigma_pk_id`                | enigma private_key_id                                                                          | `""`                            |
| `mult.podAnnotations`              |                                                                                                | `undefined`                     |
| `capi.podAffinityPreset`           | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                            |
| `capi.podAntiAffinityPreset`       | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                          |
| `capi.nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                            |
| `capi.nodeAffinityPreset.key`      | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                            |
| `capi.nodeAffinityPreset.values`   | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                     |
| `capi.affinity`                    | Affinity for CAPI pods assignment                                                              | `undefined`                     |


### Usercode Parameters

| Name                                 | Description                                                                                    | Value                       |
| ------------------------------------ | ---------------------------------------------------------------------------------------------- | --------------------------- |
| `usercode.name`                      |                                                                                                | `usercode`                  |
| `usercode.image.registry`            |                                                                                                | `docker-hub.middleware.biz` |
| `usercode.image.repository`          |                                                                                                | `public/usercode`           |
| `usercode.image.tag`                 |                                                                                                | `7.2.1`                     |
| `usercode.image.pullPolicy`          |                                                                                                | `IfNotPresent`              |
| `usercode.image.pullSecrets`         |                                                                                                | `undefined`                 |
| `usercode.resources.limits.cpu`      |                                                                                                | `1000m`                     |
| `usercode.resources.limits.memory`   |                                                                                                | `1000Mi`                    |
| `usercode.resources.requests.cpu`    |                                                                                                | `50m`                       |
| `usercode.resources.requests.memory` |                                                                                                | `50Mi`                      |
| `usercode.autoscaling.enabled`       |                                                                                                | `false`                     |
| `usercode.enigma_pk_id`              | private_key_id from enigma                                                                     | `""`                        |
| `usercode.podAnnotations`            |                                                                                                | `undefined`                 |
| `capi.podAffinityPreset`             | Pod affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`       | `""`                        |
| `capi.podAntiAffinityPreset`         | Pod anti-affinity preset. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard`  | `soft`                      |
| `capi.nodeAffinityPreset.type`       | Node affinity preset type. Ignored if `capi.affinity` is set. Allowed values: `soft` or `hard` | `""`                        |
| `capi.nodeAffinityPreset.key`        | Node label key to match. Ignored if `capi.affinity` is set                                     | `""`                        |
| `capi.nodeAffinityPreset.values`     | Node label values to match. Ignored if `capi.affinity` is set                                  | `undefined`                 |
| `capi.affinity`                      | Affinity for CAPI pods assignment                                                              | `undefined`                 |


### SingleAccount ( under construction )

| Name                  | Description                                          | Value   |
| --------------------- | ---------------------------------------------------- | ------- |
| `sa.enabled`          | enable or disable SingleAccount (under construction) | `false` |
| `sa.google_client_id` |                                                      | `8888`  |


### SingleAccount Web ( under construction )

| Name               | Description | Value |
| ------------------ | ----------- | ----- |
| `sa_web.subdomain` |             | `sa`  |


### GitCall Parameters

| Name                      | Description                                        | Value            |
| ------------------------- | -------------------------------------------------- | ---------------- |
| `gitcall.enabled`         | enable or disable gitcall ( installed separately ) | `false`          |
| `gitcall.mq_vhost`        |                                                    | `/gitcall`       |
| `gitcall.dunder_mq_vhost` |                                                    | `/dundergitcall` |


### Enigma Parameters

| Name                | Description | Value   |
| ------------------- | ----------- | ------- |
| `enigma.enabled`    |             | `false` |
| `enigma.encryption` |             | `false` |


### Store Dumps Parameters

| Name                 | Description                     | Value  |
| -------------------- | ------------------------------- | ------ |
| `store_dumps.enable` | - enable store erlang crashdump | `true` |


### External Redis(TM) Parameters

| Name                                      | Description                                                                 | Value            |
| ----------------------------------------- | --------------------------------------------------------------------------- | ---------------- |
| `externalRedis.host`                      | External Redis host                                                         | `""`             |
| `externalRedis.port`                      | External Redis port                                                         | `""`             |
| `externalRedis.password`                  | External Redis password                                                     | `""`             |
| `externalRedis.existingSecret`            | Existing secret for the external redis                                      | `""`             |
| `externalRedis.existingSecretPasswordKey` | Password key for the existing secret containing the external redis password | `redis-password` |


### External RabbitMQ Configuration

| Name                        | Description                                                             | Value  |
| --------------------------- | ----------------------------------------------------------------------- | ------ |
| `externalRabbitmq.host`     | Host of the external RabbitMQ                                           | `""`   |
| `externalRabbitmq.port`     | External RabbitMQ port number                                           | `5672` |
| `externalRabbitmq.username` | External RabbitMQ username                                              | `""`   |
| `externalRabbitmq.password` | External RabbitMQ password. It will be saved in a kubernetes secret     | `""`   |
| `externalRabbitmq.vhost`    | External RabbitMQ virtual host. It will be saved in a kubernetes secret | `""`   |


### External Elasticsearch Configuration

| Name                             | Description                                                         | Value  |
| -------------------------------- | ------------------------------------------------------------------- | ------ |
| `externalElasticsearch.host`     | Host of the external RabbitMQ                                       | `""`   |
| `externalElasticsearch.port`     | External RabbitMQ port number                                       | `9200` |
| `externalElasticsearch.password` | External RabbitMQ password. It will be saved in a kubernetes secret | `""`   |


### External Postgres Configuration

| Name                                                   | Description                                                                                                       | Value                      |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `externalPostgresql.postgresqlHost`                    | Host of the external Postgresql                                                                                   | `postgresql.cluster.local` |
| `externalPostgresql.postgresqlPostgresUsername`        | root user for external  Postgresql                                                                                | `postgres`                 |
| `externalPostgresql.postgresqlPostgresPassword`        | root password for external  Postgresql                                                                            | `""`                       |
| `externalPostgresql.postgresqlUsername`                | PostgreSQL user (has superuser privileges if username is `postgres`)                                              | `""`                       |
| `externalPostgresql.postgresqlPassword`                | PostgreSQL password                                                                                               | `""`                       |
| `externalPostgresql.postgresqlPort`                    | postgresql Port                                                                                                   | `5432`                     |
| `externalPostgresql.postgresqlMaxConnections`          | Maximum total connections                                                                                         | `1000`                     |
| `externalPostgresql.postgresqlPostgresConnectionLimit` | Maximum connections for the postgres user                                                                         | `1000`                     |
| `externalPostgresql.postgresqlDbUserConnectionLimit`   | Maximum connections for the created user                                                                          | `1000`                     |
| `externalPostgresql.shards_count`                      | count of shards created in postgresql, if unset, default - 10                                                     | `10`                       |
| `externalPostgresql.shards`                            | count of shards created in psql, if unset, default - 10 - in array format                                         | `10`                       |
| `externalPostgresql.maxclientconn`                     | Maximum number of client connections allowed.                                                                     | `100000`                   |
| `externalPostgresql.default_pool_size`                 | How many server connections to allow per user/database pair. Can be overridden in the per-database configuration. | `5000`                     |
| `externalPostgresql.default_pool_mode`                 | Server is released back to pool after transaction finishes. default: session (transaction | session)              | `transaction`              |
| `externalPostgresql.postgres_schema.version`           | Corezoid postgres schema version                                                                                  | `5.7.0`                    |
| `externalPostgresql.rotation.enabled`                  | cronjob for truncate tasks_archive table                                                                          | `true`                     |
| `externalPostgresql.rotation.schedule`                 | cleanup period in crontab format  minute hour day month dayofweek                                                 | `0 0 1 * *`                |


