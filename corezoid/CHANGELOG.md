## Changelog
https://doc.corezoid.com/docs/release-notes


### Chart 0.24.3 [ Corezoid 6.8.4 ]
- Applications versions:
  - capi - 8.5.1.3
  - mult - 3.4.1.1
  - webadm - 6.8.5
  - http-worker - 4.3.0.1
  - usercode - 9.1.1
  - worker - 5.3.0.2
  - syncapi - 3.8.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.8.1
  - limits - 2.5.1

### Chart 0.24.2 [ Corezoid 6.8.3 ]
- Applications versions:
  - capi - 8.5.1.3
  - mult - 3.4.1.1
  - webadm - 6.8.3
  - http-worker - 4.3.0.1
  - usercode - 9.0.2
  - worker - 5.3.0.2
  - syncapi - 3.8.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.8.1
  - limits - 2.5.1

- Bugfix in worker and capi
- New Features:
  - Introduced robust code snippet support in the Start node's webhook panel, inspired by Postman's Code Snippets, enabling users to generate ready-to-use requests in over 20 programming languages (e.g., JavaScript, Python, Go, PHP, Java, C#, SQL, etc.) with full support for headers like Cookie and Origin, as well as Basic Auth
  - Improved the webhook URL interface, enhanced accessibility via ARIA attributes
  - Introduced the new "Request Parameters" tab that provides both key-value and raw editing modes

### Chart 0.24.1 [ Corezoid 6.8.2 ]
- Applications versions:
  - capi - 8.5.1.2
  - mult - 3.4.1.1
  - webadm - 6.8.2
  - http-worker - 4.3.0.1
  - usercode - 9.0.2
  - worker - 5.3.0.1
  - syncapi - 3.8.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.8.1
  - limits - 2.5.1
- Bugfix in mult and capi
- Added support for a separate RabbitMQ for HTTP queues
  - Implemented the ability to configure and use a second RabbitMQ instance specifically for HTTP queues
  - Configuration is done through the new mq_http block in the global values.yml
  - Parameters include:
    - TLS settings
    - Secret configuration (automatic/manual creation)
    - Connection settings (host, port, vhost, credentials)
  - Functionality is activated through the `{{- if hasKey .Values.global "mq_http" }}` check in the relevant subcharts

- Added separate CronJob for tasks_history table cleanup
  - Implemented a new CronJob (postgres-taskhistory-cron) to manage tasks_history table cleanup
  - The previous CronJob (postgres-taskarchive-cron) now handles only tasks_archive table cleanup
  - Updated configuration in global values.yaml:
    - Replaced single schedule parameter with two separate parameters:
      - `scheduleArchive`: controls the tasks_archive cleanup schedule
      - `scheduleHistory`: controls the tasks_history cleanup schedule
  - Both schedules can be configured independently using crontab format
  - Configuration example:
    ```yaml
    db:
      rotation:
        enabled: true
        scheduleArchive: "0 0 1 * *"
        scheduleHistory: "0 0 1 * *"
    ```
- Added ability to configure PgBouncer log verbosity level via `global.db.pgbouncer_log_level` parameter.


### Chart 0.24.0 [ Corezoid 6.8.0 ]
- Applications versions:
  - capi - 8.5.0.1
  - mult - 3.4.0.2
  - webadm - 6.8.0
  - http-worker - 4.3.0.1
  - usercode - 9.0.2
  - worker - 5.3.0.1
  - syncapi - 3.8.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.8.1
  - limits - 2.5.1

### New Features
#### 1. The functionality to delete tasks in End nodes using the `"type": "delete", "obj": "task"` API method has been added.
#### 2. The interaction between different Stages and Projects has been implemented by adding the "Project" and "Stage" additional fields to Copy Task, Modify Task, and Call a Process.
#### 3. You can now use environment variables in the following nodes: Copy Task, Modify Task, API Call, DB Call, Condition, Call a Process, Reply to Process, and Set Parameters. Currently, secret variables can only be used within API Call nodes.
#### 4. A new optional filter for sorting variables in your projects has been added.
#### 5. The current versions of Erlang and JavaScript installed with Corezoid can now be found displayed in the lower right corner of the Code editor within Code nodes.
#### 6. The `api_sign_time_window` parameter was added to the Superadmin panel to specify the maximum duration within which the `GMT_UNIXTIME` timestamp sent in a request is deemed valid.
#### 7. The `max_keep_alive_length, 0` parameter is transferred to the Superadmin panel.
#### 7. The AI assistant has been integrated into Code nodes for automatic code completion, explanations, and comment additions - `.Values.global.capi.copilot_sdk`

### Bug Fixes
#### 1. A bug has been fixed that allowed users without Modify permission to create objects using the Corezoid API.
#### 2. The synchronization error with the Account when changing a Corezoid user group owner has been fixed.
#### 3. Fixed a bug that allowed workspace admins to modify user groups of other workspace owners.
#### 4. Fixed the issue with the Sync API timing out when the internet connection is lost.
#### 5. Fixed the issue where the Dashboard name did not update when copied with a new name.
#### 6. Fixed the issue of getting an invalid count when using the `conv[conv_id].node[node_id].count` construct after the merge operation.
#### 7. Fixed the issue where changing a final node (End) type from Success to Error did not properly update the node edge color.
#### 8. Fixed an issue with displaying icons for operations on user groups when opening them under Superadmin role.


### Chart 0.23.10 [ Corezoid 6.7.3 ]
- Applications versions:
  - capi - 8.4.1.3
  - mult - 3.3.1.2
  - webadm - 6.7.3
  - http-worker - 4.2.1.2
  - usercode - 9.0.2
  - worker - 5.2.1.1
  - syncapi - 3.7.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1
- Bugfix in mult
- Fixed the issue when the API Call did not return Set-Cookie
- With this version we begin a gradual migration to our new Harbor - https://hub.corezoid.com
  Please allow access from your environments.
- The management of pgbouncer images has been moved to the global Values


### Chart 0.23.9 [ Corezoid 6.7.1 ]
- Applications versions:
  - capi - 8.4.1.3
  - mult - 3.3.1.1
  - webadm - 6.7.0
  - http-worker - 4.2.1.1
  - usercode - 9.0.2
  - worker - 5.2.1.1
  - syncapi - 3.7.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1
- bugfix in capi


### Chart 0.23.8 [ Corezoid 6.7.0 ]
- Applications versions:
  - capi - 8.4.1.2
  - mult - 3.3.1.1
  - webadm - 6.7.0
  - http-worker - 4.2.1.1
  - usercode - 9.0.2
  - worker - 5.2.1.1
  - syncapi - 3.7.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1

### Improvements
#### 1. The automatic current date parameter sending when not specified in the $date function has been added.
#### 2. The current implementation of the randomizer module in Erlang (`rand:uniform/1`) has been made available for use in Corezoid.
#### 3. Made ID value substitution in the `{{conv[id].ref[ref].key}}` construction to be performed regardless of its position in JSON.
#### 4. The ability to control My Corezoid accessibility for all environment users has been added to the Superadmin menu.


### Chart 0.23.7 [ Corezoid 6.6.0 ]
- Applications versions:
  - capi - 8.4.0.3
  - mult - 3.3.0.1
  - webadm - 6.6.0
  - http-worker - 4.2.0.1
  - usercode - 9.0.2
  - worker - 5.2.0.1
  - syncapi - 3.6.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1
- Added the ability to manage worker parameters
- Added priority class
- Removed old settings for applications (sbwt and SCHEDULERS)

### Chart 0.23.6 [ Corezoid 6.6.0 ]
- Applications versions:
  - capi - 8.4.0.3
  - mult - 3.3.0.1
  - webadm - 6.6.0
  - http-worker - 4.2.0.1
  - usercode - 9.0.2
  - worker - 5.2.0.1
  - syncapi - 3.6.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1
- bugfix in usercode sentinel


### Chart 0.23.5 [ Corezoid 6.6.0 ]
- Applications versions:
  - capi - 8.4.0.3
  - mult - 3.3.0.1
  - webadm - 6.6.0
  - http-worker - 4.2.0.1
  - usercode - 9.0.1
  - worker - 5.2.0.1
  - syncapi - 3.6.1
  - web_superadm - 2.6.2
  - conf_agent_server - 2.7.1
  - limits - 2.5.1
- Added `tolerations` for pods
- A new parameter redistype has been added. In environments where AWS Elasticache Redis is used, it is necessary to specify `redistype: elasticache`.

### Improvements
#### 1. Folder-sharing implementation has been optimized for speed.
#### 2. The "show","obj":"company_keys" obsolete method was disabled.



### Chart 0.23.4 [ Corezoid 6.5.6 ]
- Applications versions:
  - capi - 8.3.9.2
  - mult - 3.2.7.1
  - webadm - 6.5.6
  - http-worker - 4.1.5.1
  - usercode - 9.0.1
  - worker - 5.1.6.1
  - syncapi - 3.5.1
  - web_superadm - 2.6.1
  - conf_agent_server - 2.6.1
  - limits - 2.4.1
- Added centos9 support for Corezoid apps `.Values.global.centos9Repo` `.Values.global.useCentos9`

### Improvements

#### 1. Fixed the vulnerability of possible CRLF (Carriage Return Line Feed) injection for stealing user data.
#### 2. Fixed the issue of sending duplicates of Corezoid password reset email notifications.


### Chart 0.23.3 [ Corezoid 6.5.5 ]
- Applications versions:
  - capi - 8.3.9.1
  - mult - 3.2.7.1
  - webadm - 6.5.5
  - http-worker - 4.1.5.1
  - usercode - 9.0.1
  - worker - 5.1.6.1
  - syncapi - 3.5.1
  - web_superadm - 2.6.1
  - conf_agent_server - 2.6.1
  - limits - 2.4.1
- Added bitnami RabbitMQ subchart. New RabbitMQ version - 3.12
- New Redis version - 7.2.4
- New Elasticsearch version - 8.13.4
- New PostgreSQL version - 15.*
- Added affinity to efs\nfs, postgres, elasticsearch, redis subchart
- Updated imageInit alpine image tag

### Improvements

#### 1. Warning: The OpenSSL 1.* is no longer supported, services that use old cipher protocols may stop operating;
#### 2. Support for the xregexp library has been added to the Code node.
#### 3. The format of http_worker info logs was changed: the ConvId and TaskId parameters have been added.
#### 4. The sending of user blocking info has been added to the capi-user-activity-conv system process.
#### 5. On the System Settings page, you can switch between dark and light UI themes using the theme toggle.
#### 6. Fixed the issue that caused the `$.unixtime().tz` function to return an incorrect GMT-2 value for the GMT+2 argument.
#### 7. For an empty task run through a process, the "show":"task" API method now returns the `"data": {}` empty object in the final node instead of `"data": []` empty array.
#### 8. Now, in the Header parameters field of the API Call node, when the dynamic diag_id parameter value is transferred using the `conv[{{diag_id}}].ref[{{ref}}].param` construction on processes export/import, the parameter value in the API Call node is updated.
#### 9. In the Superadmin menu, the `AccountId` parameter (Account ID of the user) and the user's current block status are shown together with the `UserId` parameter.


### Chart 0.23.2 [ Corezoid 6.5.2 ]

### Helm changes
- Applications versions:
  - capi - 8.3.5.1
  - mult - 3.2.4.1
  - webadm - 6.5.2
  - http-worker - 4.1.4.1
  - usercode - 8.3.1
  - worker - 5.1.4.1
  - syncapi - 3.3.2
  - web_superadm - 2.5.1
  - conf_agent_server - 2.4.1
  - limits - 2.3.1

### Improvements

- In the Superadmin menu, the possibility to activate signing with a certificate and key for the SAML authentication provider was added;
- The format of http_worker info logs was changed: “ConvId” and “TaskId” parameters were added;
- The sending of user blocking info was added to the “capi-user-activity-conv” system process.


### Chart 0.23.1 [ Corezoid 6.5.0 ]

### Helm changes
- Applications versions:
    - capi - 8.3.3.2
    - mult - 3.2.2.1
    - webadm - 6.5.0
    - http-worker - 4.1.2.1
    - usercode - 8.2.1
    - worker - 5.1.2.1
    - syncapi - 3.2.2
    - web_superadm - 2.3.2
    - conf_agent_server - 2.3.1
    - limits - 2.2.1

### Improvements

 - `**Attention!**` In previous releases there were changes, all traffic was sent through web_adm, now before deployment you need to manually delete all ingresses, then perform a deployment, which will install only 1 ingress with different locations (paths)
 - The basic authentication was added, allowing you to secure receiving requests via Direct URL in Start nodes by enabling username and password authentication. You can use it with aliases and variables.
 - The ability to change the email link displayed in the "Contact with" section of error messages displayed to users was added.
 - Operations of users adding and removing from a group are logged in the `capi_user_activity_conv` process.
 - The rounding of numbers to the specified position after the decimal point was added for responses to the requests made with the GET response method in the API Call node.
 - The number of tasks received in one response to the request in the list: node method can be limited using the `mult_key_api_throughput_tasks` parameter.

### Chart 0.23.0 [ Corezoid 6.4.1 ]

### Helm changes
- Applications versions:
    - capi - 8.3.1.1
    - mult - 3.2.1.1
    - webadm - 6.4.1
    - http-worker - 4.1.1.1
    - usercode - 8.1.1
    - worker - 5.1.1.1
    - syncapi - 3.1.2
    - web_superadm - 2.2.0
    - conf_agent_server - 2.2.2
    - limits - 2.1.2

### Improvements
- Fixed tls connection for external RabbitMQ(via AWS NLB balancer TLS protocol), ElastiCache(Redis), Ingress, PgBouncer


### Chart 0.22.9 [ Corezoid 6.4.0 ]

### Helm changes
- Applications versions:
   - capi - 8.3.1.0
   - mult - 3.2.1.0
   - webadm - 6.4.0
   - http-worker - 4.1.1.0
   - usercode - 8.1.0
   - worker - 5.1.1.0
   - syncapi - 3.1.1
   - web_superadm - 2.2.0
   - conf_agent_server - 2.2.1
   - limits - 2.1.1

### Improvements
- Added tls connection option for external RabbitMQ, ElastiCache(Redis), Ingress, PgBouncer


### Chart 0.22.8 [ Corezoid 6.3.1 ]
- Added shared workspaces in Corezoid and Simulator.Company and creating a new company no longer requires entering an OTP password
- Added the option to share immutable Stages and objects inside them
- For private cloud and on-premises installations, support for PostgreSQL versions older than 10 has been discontinued.
- The Sender action and Sender form nodes have been removed from the node list
- Now creating a Communications Orchestrator by clicking the Create button is available only from Project Stages

### Chart 0.22.7 [ Corezoid 6.2.2 ]
- removed key db_schema_rds in values.yaml (implemented on the application side)
- fixed enigma subchart
- security update images web_adm and web_superadm (now it doesn't run as root)
- pgbouncer image update

### Chart 0.22.6 [ Corezoid 6.2.0 ]
- fixed gc in applications config file

### Chart 0.22.5 [ Corezoid 6.2.0 ]
- The new variables feature has been added. Variables are Stage objects in which you can store data in RAW and JSON formats.
- Variables enable you to store certificates and use them in API Call nodes by calling a variable by ID or short name.

### Chart 0.22.4 [ Corezoid 6.1.1 ]
- bugfix in mult
- changed section dbcall\gitcall in config capi\worker

### Chart 0.22.3 [ Corezoid 6.1.0 ]
- Correcting typos in capi pvc and Chart Version

### Chart 0.22.2 [ Corezoid 6.1.0 ]
- For each Multitenant environment, the ability to assign SAML providers for each Tenant has been added (if you have used SAML before, we recommend reading SAML auth_providers in the README file)
- Starting from Corezoid version 6.1, support for Redis 7.0 has been added

### Chart 0.22.0 [ Corezoid 6.0.0 ]
- Starting from version 6.0, Corezoid uses a new license. When upgrading to Corezoid 6.0 or newer from an older version you must use a new license file for Corezoid (Before upgrading, request a new license file).
- Erlang was updated to version 24.3 for Corezoid components, increasing data exchange speed between components;
- Group owners can now transfer ownership of their user groups.
- All newly created API Call nodes will be called API Call v2. The new API Call version will allow users to specify custom Content-type for any data format selected
- The current progress will now be displayed when copying large objects in the main menu
- Updated alpine version to 3.17
- Redesigned ingress to fine-tune annotations for headers
  If you have ingress `enabled: true` in `values.yaml` then, before updating, you need to delete the old ingress in your Corezoid namespace (instead of it there will be new separate ingresses)
- Elasticsearch was updated to version 8.6.0
   After updating Elasticsearch, when the new Elasticsearch starts up, you need to go to one of the capi pods.
   Go to remote_console
   `/ebsmnt/erlang/capi/bin/capi remote_console`
   Execute without interrupting commands:
   `capi_elasticsearch:migrate().`
   It is enough to perform these actions on one capi pod
- Added disable merchant-api
   You no longer need to use the merchant-api application to create companies in Corezoid 6.0.0. It is enough to set the `companies_manager: "corezoid_internal"` flag in values.yaml and disable the merchant-api for the creation of companies to work.

### Chart 0.21.6 [ Corezoid 5.11.0 ]
- The “conv_title” method was removed from Corezoid API
- The Aliases tab was moved to the Folders section of the workspace menu
- Fixed a bug in the process Activity Monitor, which caused data not displaying for the finish date of a selected date range
- jQuery library was updated to version 1.12.4, fixed the vulnerability of missing tokens to prevent CSRF attacks
- Changed the logic of the "create","obj":"invite" API method for inviting users to a company
- When going through an API Call node, an empty task is passed as an object, not an array
- The “Parent REF” task field that contains a parent process ref was added to the task info view in the process editor
- In the Trash now displays a side panel with the object’s parent object info

### Chart 0.21.5 [ Corezoid 5.10.1 ]
- Merge functionality is available
- Add support of “map” and “filter” Erlang functions for Set Parameters nodes
- Code editor was updated and now supports a correct display and work with code written in the following programming languages: JS, Python, Go, PHP, Java, Erlang, XML, MySQL, Microsoft SQL Server и PostgreSQL
- Moment.js library was updated. The library has backward compatibility with the old version
- Compatibility: elasticsearch 7, Centos 8
- fix сontent- type xml with parameters
- added new key db_schema_rds in values.yaml (to work with base in AWS RDS)

### Chart 0.19.5 [ Corezoid 5.9.0 ]
- cookie secure flag for api
- avalible enable 2fa with check_2fa env in capi block
- debug mode for http-worker with logs debug on enable

### Chart 0.19.4 [ Corezoid 5.8.1 ]
- dbcall integration
- init job change naming
- add saml. For add second saml provider - add .Values.global.capi.capi_saml_secret_support: true
- add recaptcha or hcaptcha provider of captcha
- internal communication for corezoid_sdk

### Chart 0.19.3 [ Corezoid 5.8 ]
- add http.max_keep_alive_connections_len - polling keep-alive connections. If zero it'll open new connection each query
- add worker.write_data_to_history - write or not tasks data into table
- add prometheus_metrics enable/disable ( default - disable )
- add optional basic auth to elasticsearch
- new captcha providers - recaptcha end hcaptcha
- trash scrapper - add capi values to configure the emptying the basket

### Chart 0.19.2 [ Corezoid 5.7.1 ]
- add elasticsearch schema variable

### Chart 0.19.1 [ Corezoid 5.7.1 ]
- add redis sentinel
- fix store dumps ingress
- elastic initContainers now pulled from mw repo

### Chart 0.19 [ Corezoid 5.7.0 ]
- prometheus_metrics of applications
- global log_level
- manage vm.args

### Chart 0.18.1 [ Corezoid 5.6.1 ]
Improvements:
- Fix duplicate checksum/config in deployments
- COR-8773 (MAM-872) - Add a single parameter to HELM CHART config for managing logging levels

### Chart 0.18 [ Corezoid 5.6.1 ]
Improvements:
- add crashdump saver with telegramm integration
- remove http->https forward from superadmin
- fix cronjob
- fix usercode connections to rmq
- add SCHEDULERS and sbwt option to vm.args
- move vm.args to configmaps
- Enable shareProcessNamespace as replace for tini (github.com/krallin/tini)
- Fix mult pvc when pvc disable
- tune http_consumer for http-worker default options
- add checksum for vm.args

### Chart 0.17 [ Corezoid 5.6.1 ]
Improvements:
- Upgrade to Corezoid 5.6.1
- performance tune
- fix garbage collector work, (queues ctrl and settings)
- remove legacy code
- fix reconect app to pgbouncer while them restart
- add dns cache on http-worker
- move http_consumer block to http-values
- testing pgbouncer ha with pods when pgbouncer is scale up/down
- remove http2 from alb - fix MAX_CONCURRENT_STREAMS error for server: Cowboy
- remove nginx from chain from lb to app
- remove check connect to elasticsearch as dependency to allow start
- move queues from config to  values http-worker
- testing autoscale CPUUtilizationPercentage
- add NODE_COOKIE to http-worker
- add metrics to apps (127.0.0.1:9100/metrics)
- fix redis - passwd must be empty

### Chart 0.16 [Corezoid 5.5.1]
Improvements:
- Upgrade to Corezoid 5.5.1
- fix rmq always Running queue
- fix autoclean queue from rabbit
- add gitcallv2 support
- fix init containers for mult and usercode
- upgrade pgbouncer
- upgrade Content-Security-Policy
- fix error "UPGRADE FAILED: cannot patch "postgres-init-database""

### Chart 0.15 [Corezoid 5.4.3]
Improvements:
- Refactor secrets and clean old variables
- Upgrade to Corezoid 5.4.3
- add NODE_COOKIE to control app in current namespace
- Add config for pvc
- move secrets to root chart
- Added the ability to block ip or domains in apicall
- Added restricting user registration by domain
- Fix for captcha configuring
- add pgboucer min replicas from 2
- fix dockerhub rate limit issue



### Chart 0.14 [Corezoid 5.4.1]
Improvements:
- MAM-615 - Provide support for running Corezoid in Azure
- Move init db in job
- Remove postgres container when db.internal: true
- Remove nginx pods for syncapi service
- Add taskarchive-cron for truncating task_archive
- Moved the logo in a separate place /files/logo.svg - now everyone can set it individually for themselves
- Moved the corporate identity settings into the general configuration

Bugs fixes:
- Fix Cors for connect-src and Feature-Policy
- Fix global.repotype absence in some charts


### Chart 0.13 [Corezoid 5.3.0]
Improvements:
- MAM-685: Move nginx rps limits to values
- MAM-671: Dynamic cookie name
- MAM-626: Allow changing cookie_expr_time parameter from the superadmin panel
- MAM-588: Add liveness and rediness probes worker and mult
- MAM-577: Move capi memory limit values as a parameters into values.yaml
- MAM-660: Rotation archive task
- MAM-350: Services shutdown gracefully
- MAM-675: add patch inbound CIDR limitation

Bugs fixes:
- MAM-498: Nothing happens when clicking on Create User/API Key/Group button when user has no rights
- MAM-569: Forbid the creation of Companies with same name and Users having the same email address on the backend
- MAM-605: Admin users cannot see content of Code nodes and when they deploy changes errors appear
- MAM-496: [Multitenancy] Admin user that is part of multiple companies is unable to login in any of them if one of his companies is blocked
- MAM-527: Error is displayed when uploading a process for the first time in multi-tenant Corezoid
- MAM-542: Creator of Group is not visible in the Group and cannot be added by other Admins

### Chart 0.12 [Corezoid 5.1.1]
Improvements:
- MAM-545: Prevent Username/Email Enumeration
- MAM-546: Reflected XSS in API
- MAM-547: Insufficient Session Timeout
- MAM-550: Prevent Folder Name Information Disclosure
- MAM-551: Prevent Admin Email Disclosure
- MAM-561: Cross-Site Websocket Hijacking (CSWSH)
- MAM-131: SSRF via Process can be used to leak AWS credentials or to access internal network

### Chart 0.11 [Corezoid 5.0]
- MAM-577: Move capi memory limit values as a parameters into values.yaml

- MAM-578: Add syncapi as deps for api

- Made some autoscale tuning and add ENIGMA.md manual

### Chart 0.10 [Corezoid 5.0]

- MAM-541: Inquiry about k8s config - capi:front_setting:host:doc
Moving URL for documentation into the values.yaml:
```
    front_setting:
      # documentation (navigate by clicking on DOCS link)
      doc_host: "support.mycompany.com"
      doc_index: "/docs"
```

- MAM-557: Getting folder structure via Corezoid API returns 502 Bad Gateway
Memory limit increase for capi-deployment
```
resources:
  limits:
  cpu: 1200m
  memory: 1500Mi
```

- MAM-571: Sync API service not working on sandbox and production multi-tenant
Moving SyncAPI to the single POD, resolve issue with 504 error, when back-end was restarted. Tuning configuration and performance.

- MAM-574: Make skip_otp configurable per environment, in capi-configmap
Allow parameterizing {skip_otp, true} for capi-configmap in values.yaml:
```
    # merchant_api settings
    merchant_api:
      skip_otp: true
```

- MAM-549: Missing HTTP Security Headers
Update web-configmap-site.yaml for some security issues.
