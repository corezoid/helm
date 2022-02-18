# Corezoid «Enigma» activating

Current actual schema: [link]

In AWS console create policy **CZ-KMS-Enigma-Policy**:

```{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "kms:ListKeys",
                "kms:Decrypt",
                "kms:TagResource",
                "kms:Encrypt",
                "kms:ScheduleKeyDeletion",
                "kms:CreateAlias",
                "kms:DescribeKey",
                "kms:CreateKey",
                "kms:ListResourceTags",
                "kms:DisableKey",
                "iam:ListGroups",
                "iam:ListRoles",
                "iam:ListUsers"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "AWS_region"
                }
            }
        }
    ]
}
```
** Necessary KMS Actions:
https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html

At this point here are two ways:

You can attach this policy to your EC2 nodegroup IAM Role or 
Use this role inside POD via enabling IAM roles for service account 

First way is easier. Second is a little complicated but secure and preferable.
Follow by official AWS manual: https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html

After what we can use our role from POD. Let’s attach and test it.
Edit aws_kms_role enigma section in global **values.yaml** file with your role name:
```
# enigma global settings
  enigma:
    enabled: false
    encryption: false
    key_manager:
      tag: 1.0-e19
      aws_kms_role: "arn:aws:iam::AWS_account_ID:role/CZ-KMS-Enigma-Role"
```
**for now leave ```enabled``` and ```encryption: false```

It will automatically enable ServiceAccount for enigma-key-manager POD in helm template:
```
{{- if .Values.global.enigma.key_manager.aws_kms_role }}
apiVersion: v1
kind: ServiceAccount
metadata:
  annotations:
    eks.amazonaws.com/role-arn: {{ .Values.global.enigma.key_manager.aws_kms_role }}
  name: enigma-kms-service
{{- end }}
```

Now login into enigma-key-manager POD and check if AWS KMS available from it:

```$ export ENIGMA_POD_NAME=$(kubectl get pods -l "tier=enigma-key-manager" -o jsonpath="{.items[0].metadata.name}")```

```$ kubectl exec -it $ENIGMA_POD_NAME sh```

**Run get keys just for test**:
```$ curl -s -H "Content-Type: application/json" -H "Accept: application/json" -X GET http://enigma-key-manager-service:8080/v1/master-keys```

If all is OK now we can create Master Key:
```$ curl -s -d '{"alias": "EnigmaMasterKey", "note":"Enigma Master Key"}' -H "Content-Type: application/json" -H "Accept: application/json" -X POST http://enigma-key-manager-service:8080/v1/master-keys```

And again if all is OK you get output with payload such as:

```{"code":0,"payload":"arn:aws:kms: AWS_region: AWS_account_ID:key/e052046c-982e-492e-83d2-12d7796d8c9e"}```

By following **Master Key ID** now we can create private keys for all Corezoid components which require encryption:

Create private key (for testing — you can use one private key for all components).
Please note – use here your **Master Key ID** from previous payload output and set correct expire time in unixtime format:
```$ curl -s -d '{"masterKeyId": "e052046c-982e-492e-83d2-12d7796d8c9e", "algorithm": "aes-256-gcm", "expireTime": 1594080000, "note":"corezoid private key"}' -H "Content-Type: application/json" -H "Accept: application/json" -X POST http://enigma-key-manager-service:8080/v1/private-keys```

And you will get payload output with generated private key, such as:
```{"code":0,"payload":"2dd73448-36c0-11ea-ab9e-02ba652f967c"}```

Now we can use this key for encryption. Edit global **values.yaml** file again and find enigma section and set enabled and encryption values to ```true```:
```
# enigma global settings
  enigma:
    enabled: true
    encryption: true
```
and set your private key(s) id for all Corezoid modules like that:
```
# conveyor-worker
  worker:
    tag: v3.3.0.6-e19
    minReplicas: 2
    maxReplicas: 2
    # enigma private_key_id
    enigma_pk_id: "2dd73448-36c0-11ea-ab9e-02ba652f967c"
```
After all that you can upgrade your env by helm upgrade or kubectl. All PODs with enigma should be restarted.
To ensure if tasks really encrypted — run simple process, and find its data in DB:

```cp0=> select encrypted_data from tasks_archive;```

That’s all! 


NB: For graceful deactivating enigma, for first, set in global **values.yaml** ```encryption: false```
but leave ```enabled: true``` :
```
# enigma global settings
  enigma:
    enabled: true
    encryption: false
```
This will allow tasks that have not yet finished at the moment of switching to be correctly finalized.

