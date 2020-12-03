# Corezoid k8s installation

[![N|Corezoid](https://corezoid.com/static/CorezoidProduct-ce1da2c78726bb5ce1cf53b002dac519.png)](https://corezoid.com/)

##Corezoid Docs: 
https://doc.corezoid.com/

##Corezoid change log
https://doc.corezoid.com/docs/release-notes

## Installation notes:

- If you install chart to the new environment with empty DB — all will be provisioned automatically and should be fine.

-  If you upgrade previous working installation that doesn't have setuped Sync-API or/and download/upload API (*Check info group id: sync_api_key* and *api_multipart_key* keys) — these keys will not be provisioned automatically either. You have to do some manual fixes (please ask Support Team and see admin-book troubleshooting).
In case if they were working — nothing to do, all should be fine.


### Known issues:
---
while ```helm upgrade chart .```

```Error: UPGRADE FAILED: cannot patch "postgresql-init-database" with kind Job: Job.batch "postgresql-init-database" is invalid:```

Resolving:
- ```$ kubectl delete job postgresql-init-database```
- ```$ helm upgrade chart .```

Ensure what all configmaps are updated and necessary components are restarted.

#### Versioning:
|Corezoid|Capi|Conf-agent|Enigma|Web-adm|Web-superadm|Http-worker|Merchant|Mult|Sync-API|Limits|Usercode|Worker|
| ------ | ------ | ------ |------ |------ | ------ | ------ | ------ |------ |------ |------ |------ | ------ |
| 5.4.3 | 7.4.2.5 | 1.3.1 | 1.1.0 | 5.4.4 | 1.3.1 | 3.4.1.1 | v0.0.27.2 | 2.4.1.0 | 2.0.2 | 1.1.1 | 7.2.0 | 4.4.1.1 |
| 5.4.1 | 7.4.0.3 | 1.3.1 | 1.1.0 | 5.4.1 | 1.3.1 | 3.4.0.2 | v0.0.27.2 | 2.4.0.1 | 2.0 | x | 7.2.0 | 4.4.0.2 |
| 5.3 | 7.3.0.5 | 1.2.1 | 1.1.0 | 5.3.0 | 1.2.1 | 3.3.0.2 | v0.0.27.2 | 2.3.0.3 | 1.4.1 | x | 7.1.0 | 4.3.0.2 |
| 5.0 | 7.0.0.3 | x | 1.1.0 | 2.43 | 0.0.1 | 3.0.0.1 | v0.0.27.2 | 2.0.0.1 | 1.1.3-e19 | x | 6.0.3 | 4.0.0.2 |

## Using different PersistentVolume storage classes:

In values.yaml you can choose different storage classes:
```sh
 # Define global storage class: efs (preferred) / nfs / manual / ceph | see README.md
 storage: efs
```
- **efs**: In case of using AWS as a cloud provided — efs is preferred: https://aws.amazon.com/efs/

- **nfs**: For  Kubernetes inhouse - you can use NFS. Preferably an external NAS/SAN server with a raid.
  You can also setup the NFS server on the Kubernetes nodes (directly in the cluster on pods, or separately on the nodes).
  But to provide reliability, you need to setup cluster FS, such as Gluster, Ceph, etc., between the nodes.
  Otherwise, reliability depends of one node.

- **manual**: Not production solutions / just for development.
  EBS on AWS or "manual" in aws/inhouse (allocation of space on the node section)  ebs will be located in one AZ
  but pod can be restarted on other node in another AZ and loose access to the old data.

- **ceph**: Before choosing "ceph" options you have to prepare cephfs cluster in advance.
  Please follow the instructions in described in cephf installation readme file

#### Enabling Enigma encryption:
- See [ENIGMA.md](ENIGMA.md)

#### Dependencies:
#####Testing on Kubernetes version 1.16 and helm v3
#####Supported stateful versions:
- **Postgresql 9.6**
- **Redis 3.2**
- **Elasticsearch 6.7**
- **RabbitMQ 3.8**
---

