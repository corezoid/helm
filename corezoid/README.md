[![N|Corezoid](https://api.corezoid.com/logo/logo_big_small.png)](https://corezoid.com/)  

Corezoid Docs - https://doc.corezoid.com/  

Corezoid change log - https://doc.corezoid.com/docs/release-notes  

## Installation notes:  

- Just clone repo end ``` cd corezoid ``` edit values.yaml and ```helm install corezoid-public -n public .```  

## Upgrading notes:
```helm upgrade corezoid-public -n public .```  

#### Enabling SAML encryption:  
Go to google mobile application https://admin.google.com/u/1/ac/apps/unified and click «add SAML application»  
Fill name and choose icon --next-->  
skip next step with metadata --next-->  
Fill URL ACS: https://{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/auth2/saml/google_saml_1/return  
Object ID: google_saml_1.{{ .Values.global.subdomain}}.{{ .Values.global.domain }}  
Select Title identifier format: X509_Subj --next-->  
Attributes->add  
firstname  -> first_name  
lastname  - > last_name --Done-->  

On mobile page click download metadata  
And move downloaded file to ./templates folder with name GoogleIDPMetadata.xml for first auth method or GoogleIDPMetadataSupport.xml for second «hidden» auth method, for hidden auth  - use link https://{{ .Values.global.subdomain}}.{{ .Values.global.domain }}/support  
Don’t forget to enable service (mobileapp) on User access menu - enable status service: enable for all  


#### SAML auth_providers:

In this release, the `auth_providers` parameter has been moved to separate configuration files. The following additions have been made to `values.yaml`:  
- `auth_providers_enable`: Previously responsible for enabling SAML, this parameter now controls Corezoid authentication (login/pass).  
- `auth_providers_saml_enable`: Enables or disables the SAML provider.  
- `sp_entity_id`: Requires a value that was previously in the `capi` config (in the `capi` pod, the config can be found at `/ebsmnt/conf/capi.config.2.config`).  
- `persistentVolumeClaimName`: Specifies the location for the `auth_providers` config files.  
- `persistentVolumeClaimCreate`: Specifies the location for the `auth_providers` config files.  


The `auth_providers_enable` and `auth_providers_saml_enable` parameters can be enabled separately or together. To install providers for each company during an update, enable the provider that was previously active in the environment and disable the other one. By default, two config files are created, and their management (enabling and disabling) is only possible through `helm upgrade`. These configs cannot be managed via the UI.
You can add separate new SAML providers via the UI. Management (enabling, disabling, editing) of providers newly added via the UI can be done in the UI itself.


#### Enabling Enigma encryption:  
- See [ENIGMA.md](ENIGMA.md)  

#### Dependencies:  
#####Testing on Kubernetes version 1.30 and helm v3  
#####Supported stateful versions:  
- Postgresql 13.*/15.*
- Redis 7.2.4  
- Elasticsearch 8.13.*  
- RabbitMQ 3.8/3.9/3.12   

### SYSTEM REQUIREMENTS:

#### Recommended minimum system requirements for a cluster:
- 3 instances with 4 CPUs and 8GB RAM

#### Recommended system requirements for a PROD cluster:
- 3 to 5+ instances with 8 CPUs and 16GB RAM

#### Recommendations for backend applications (PostgreSQL, RabbitMQ, Redis, Elasticsearch):
- For deployments on test (introductory) environments, Corezoid can be run with the internal:true flag, and the application backend can be hosted within the cluster
- For production environments, we recommend moving all application backend components to separate servers outside the cluster.


---

