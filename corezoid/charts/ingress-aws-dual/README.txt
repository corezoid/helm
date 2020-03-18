### If using aws-dual you will need two instances of external-dns running
### Here is an example helmfile, filtering on load balancer scheme and selecting
### appropriate AWS Route53 zone types
  - name: external-dns-public
    namespace: kube-system
    chart: stable/external-dns
    values:
    - annotationFilter: alb.ingress.kubernetes.io/scheme=internet-facing
    - aws:
        zoneType: public

  - name: external-dns-private
    namespace: kube-system
    chart: stable/external-dns
    values:
        - annotationFilter: alb.ingress.kubernetes.io/scheme=internal
        - aws:
            zoneType: private
