# Release GitCall 2.1

## Summary

* Java code
* Private repos
* Checkout tag, branch, commit
* Docker server cluster 
* Bug fixes

## Corezoid

* Minimum: 5.5.0
* New features: 5.6.1

## Changelog

[Changelog](CHANGELOG.md)

## Upgrade 2.0 to 2.1 

* `kube_goodies` component replaced by `kube`. Now, secrets could be configured:

```yaml
kube:
    dockerconfig_secrets:
        # for  migration and tests
        - name: '[RELEASE]-hook-a-registry-secret'
          labels: { app: 'gitcall', tier: 'kube', release: '[RELEASE]', hook: "true" }
          annotations:
              "helm.sh/hook": 'pre-install,pre-upgrade'
              "helm.sh/hook-delete-policy": 'hook-succeeded,hook-failed'
              "helm.sh/hook-weight": '-100'
          config:
              auths:
                  a.registry: { username: 'xxx', password: 'yyy' }
        - name: '[RELEASE]-a-registry-secret'
          labels: { app: 'gitcall', tier: 'kube', release: '[RELEASE]' }
          config:
              auths:
                  a.registry: { username: 'xxx', password: 'yyy' }
```

* `rabbitmq` component replaced by `rabbitmq_credentials`. Just rename it. The structure the same.

Remove `release.repositories.rabbitmq` section.

Add to `release.repositories` section:
```yaml
rabbitmq_credentials:
    source: 'git'
    git:
        repo: 'git@github.com:corezoid/cz-packages.git'
        path: 'rabbitmq_credentials'
```

* `postgresql` component replaced by `postgresql_credentials`. Just rename it. The structure the same.

Remove `release.repositories.rabbitmq` section.

Add to `release.repositories` section:
```yaml
postgresql_credentials:
    source: 'git'
    git:
        repo: 'git@github.com:corezoid/cz-packages.git'
        path: 'postgresql_credentials'
```

* Add to section `gitcall.config.amqp`:

```yaml
getsshkey_consumer:
    exchange: "gitcall-v2"
    queue: "gitcall-v2-getsshkey"
    prefetch: 1
    num_consumers: 1
refreshsshkey_consumer:
    exchange: "gitcall-v2"
    queue: "gitcall-v2-refreshsshkey"
    prefetch: 1
    num_consumers: 1
```

* The section `gitcall.config.dundergitcall.docker_daemon` has changed. Now, 2.0 behavior looks like this:

```yaml
docker_daemon:
  discovery: none
  hosts: ["tcp://arelease-gitcall-docker-server-service:2375"]
```

* Docker daemon HA mode.

_**WARNING**_: To enable it you docker daemon service has to be manually removed before deploy.
```
kubectl delete service arelease-gitcall-docker-server-service
```

Update `gitcall.config.dundergitcall.docker_daemon` section:
```
docker_daemon:
    discovery: "dns"
    host: 'arelease-gitcall-docker-server-service'
    port: 2375
```

Set `gitcall_docker_server.helm.service_headless` true:
```
service_headless: true
```

Now you can change `gitcall_docker_server.helm.min_replicas`

* Add java to `gitcall.config.dundergitcall.global_policy` section:

```yaml
usercode_java_runner_image: "docker-hub.middleware.biz/public/gitcall/java-runner:0.1.5"
``` 

## Migrations

* 20210114080119_COR-7625.sql - creates dundergitcall_ssh_key table
* 20210119120000_COR-8095.sql - adds company_id column to dundergitcall_service and adjust priorities in dundergitcall_policy table.
* 20210209120000_COR-8265.sql - changes company_id column length from 10 to 225 in dundergitcall_service table.