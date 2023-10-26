## Changelog
https://doc.corezoid.com/docs/release-notes

### Chart 0.23.0 [ Corezoid 6.4.1 ]

...

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
