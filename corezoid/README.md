# Corezoid k8s installation

[![N|Corezoid](https://corezoid.com/static/CorezoidProduct-ce1da2c78726bb5ce1cf53b002dac519.png)](https://corezoid.com/)

### Chart Details

This chart will deploy the Corezoid Infrastructure 5.0 version

### Installation

```sh
git clone git@github.com:corezoid/helm.git
cd helm
#edit values.yaml
helm install --name corezoid ./corezoid 
```

Kubernetes 1.14 (AWS EKS is preferred)

Tested on Kubernetes 1.14 (AWS EKS is preferred)

- *default login:* **admin@corezoid.loc**
- *Initial password (has to be changed):* **admin111**

### Configuration / some useful values

| Parameter                 | Description                                                  | Default                    |
| ------------------------- | ------------------------------------------------------------ | -------------------------- |
| `domain`                  | Second level domain only / core domain (example: corezoid.com)|                          |
| `subdomain`               | Subdomain for sitename.corezoid.com as example - k8s            | |
| `internal`                | Flag for usage service inside k8s                             | `true`                     |
| `shards_count`            | Count of shards created in psql                          | `10`                    |
| `capi_auth_hash`          | Auth hash for cookie                                           | `random`             |
| `api_front_captcha_key_disabled`          | Disable or enable  captcha on fontend       | `true`             |
| `capi_front_captcha_key`  | Key for captcha when login in UI                          |             |
| `capi_backend_captcha_key_disabled`| Disable or enable  captcha on backend                 | `true`       |
| `capi_backend_captcha_key` | Key for captcha when login in UI                    |                     |
| `market`       | Enabled Market button                             | `false`                      |
| `company`            | Button Create -> Company                             | `true`                      |
| `bot_platform`             | Button Create -> Bot platform | `false`                      |
| `default_company`          | Set default company name  | `My Corezoid`            |
| `api_max_thread`          | Max allowed threads for api logic  | `200`            |
| `max_interface_rate`          | Limit interface requests, ban after for 1 min  | `100`            |
| `max_user_rate`          | Limit for task create/modify, other will get 429 error  | `2000`            |


### Using different PersistentVolume storage classes:
---

- In values.yaml you can choose different storage classes:
```sh
 # Define global storage class: efs (preferred) / nfs / ceph / manual | see README.md
 storage: efs
```
- In case of using AWS as a cloud provided — efs is preferred: https://aws.amazon.com/efs/

- For  Kubernetes inhouse - you can use NFS. Preferably an external NAS/SAN server with a raid.
  You can also setup the NFS server on the Kubernetes nodes (directly in the cluster on pods, or separately on the nodes).
  But to provide reliability, you need to setup cluster FS, such as Gluster, Ceph, etc., between the nodes.
  Otherwise, reliability depends of one node.

- Not production solutions / just for development:
  - EBS on AWS or "manual" in aws/inhouse (allocation of space on the node section)  ebs will be located in one AZ
  but pod can be restarted on other node in another AZ and loose access to the old data.

- Before choosing "ceph" options you have to prepare cephfs cluster in advance.
  Please follow the instructions in described in cephf installation readme file
