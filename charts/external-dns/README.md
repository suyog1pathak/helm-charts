# External-Dns Installation Chart <img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" width="30px">
![](https://miro.medium.com/max/2560/1*RtYcmqA45r2ZEPUmcx_oTQ.png)


* This chart will external DNS on EKS cluster. [ Currently hardedcoded the image tag to v0.7.6]


Required Items|
------------- |
IAM Service Account|
public hosted zone  | 


**Usage:**
* Clone the repo
```
git clone -b main https://github.com/suyog1pathak/helm-charts.git
OR
git clone -b main git@github.com:suyog1pathak/helm-charts.git
```

* Change Directory
```
cd charts/external-dns
```

* Install helm chart with vars
```
helm install external-dns . --set externDns.domainName=pinaka.com --set serviceAccount=external-dns-k8s
```
var          | type |details
------------- |---- |-------------
extraLabels|{}| dict of labels  ```app.kubernetes.io/env: staging```
externDns.domainName|""|Domain name e.g scoring.com
serviceAccount|""| IAM service Account name.

**IAM Service Account required policies** 



```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "route53:ChangeResourceRecordSets"
            ],
            "Resource": "arn:aws:route53:::hostedzone/*",
            "Effect": "Allow"
        }
    ]
}
```

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "route53:ListHostedZones",
                "route53:ListResourceRecordSets",
                "route53:ListTagsForResource"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
```