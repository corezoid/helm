# Corezoid k8s installation

[![N|Corezoid](https://corezoid.com/static/CorezoidProduct-ce1da2c78726bb5ce1cf53b002dac519.png)](https://corezoid.com/)

##Corezoid Docs: 
https://doc.corezoid.com/

##Corezoid change log
https://doc.corezoid.com/docs/release-notes

## Installation notes:

- Just clone repo end ``` cd corezoid ``` edit values.yaml and ```helm install corezoid-public -n public .```
- If you install chart to the new environment with empty DB — all will be provisioned automatically and should be fine.



## Upgrading notes:
In version 0.16 of the chart, the rabbitmq version has been updated along with livenes and readynes samples - to update, you need to manually reload the rabbitmq nodes one by one. To check the correct update -
- run ```kubectl port-forward --namespace public svc/rabbit-service 15672:15672```
- check from browser  localhost:15672
    username and password can be taken from values.yaml
- go to the queue tab and make sure that idle queues are present

### Known issues:
---
while ```helm upgrade chart .```

```Error: UPGRADE FAILED: cannot patch "postgresql-init-database" with kind Job: Job.batch "postgresql-init-database" is invalid:```

Resolving:
- ```$ kubectl delete job postgresql-init-database```
- ```$ helm upgrade chart .```




Ensure what all configmaps are updated and necessary components are restarted.



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

