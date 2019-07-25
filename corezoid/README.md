# Corezoid

## Chart Details

This chart will deploy the Corezoid Infrastructure v 3.5.1

## Configuration

| Parameter                 | Description                                                  | Default                    |
| ------------------------- | ------------------------------------------------------------ | -------------------------- |
| `domain`                  | First level domainfor sitename.domain.com as example  - domain.com)|                          |
| `subdomain`               | Subdomain for sitename.domain.com as example - sitename            | |
| `superuser_login`         | Admin user in email format for login in UI                         |  admin@corezoid.loc |
| `superuser_passwd`        | Password for admin user |
| `environment`             | Namespace for cluster | prod |
| `internal`                | Flag for usage service inside k8s                             | `true`                     |
| `shards_count`            | Count of shards created in psql                          | `10`                    |
| `capi_api_secret`         | Solt secret for work with api-multipart              | `random`  |
| `capi_auth_hash`          | Auth hash for cookie                                           | `random`             |
| `api_front_captcha_key_disabled`          | Disable or enable  captcha on fontend       | `true`             |
| `capi_front_captcha_key`  | Key for captcha when login in UI                          |             |
| `capi_backend_captcha_key_disabled`| Disable or enable  captcha on backend                 | `true`       |
| `capi_backend_captcha_key` | Key for captcha when login in UI                    |                     |
| `market`       | Enabled Market button                             | `false`                      |
| `company`            | Button Create -> Company                             | `true`                      |
| `bot_platform`             | Button Create -> Bot platform | `false`                      |
| `default_company`          | Set default company name  | `My Corezoid`            |
| `search`          | Process search enable  | `true`            |
| `api_max_threads`          | Max allowed threads for api logic  | `200`            |
| `max_interface_rate`          | Limit interface requests, ban after for 1 min  | `100`            |
| `max_user_rate`          | Limit for task create/modify, other will get 429 error  | `2000`            |

## Example

```sh
git clone git@github.com:corezoid/helm.git
cd helm
#edit values.yaml
helm install --name corezoid ./corezoid 
```
