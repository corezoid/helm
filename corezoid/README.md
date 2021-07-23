[![N|Corezoid](https://corezoid.com/static/CorezoidProduct-80991adc0bc80fdda3e177ea20d188e1.png)](https://corezoid.com/)

Corezoid Docs - https://doc.corezoid.com/

Corezoid change log - https://doc.corezoid.com/docs/release-notes

## Installation notes:

- Just clone repo end ``` cd corezoid ``` edit values.yaml and ```helm install corezoid-public -n public .```

## Upgrading notes:
```helm upgrade corezoid-public -n public .```


#### Enabling Enigma encryption:
- See [ENIGMA.md](ENIGMA.md)

#### Dependencies:
#####Testing on Kubernetes version 1.19 and helm v3
#####Supported stateful versions:
- Postgresql 9.6
- Redis 3.2
- Elasticsearch 6.7
- RabbitMQ 3.8
---

