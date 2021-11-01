# Cluster AutoScaler Installation Chart <img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" width="30px">
![](https://www.xtivia.com/media/Setting-up-EKS-Cluster-AutoScaler.jpg)
 

* This chart will install cluster autoscaler on EKS cluster which will scale-in and scale-out worker autoscaling group as per the need of resources for pod scheduling.  

**Usage:**
* Clone the repo
```
git clone -b main https://github.com/suyog1pathak/helm-charts.git
OR
git clone -b main git@github.com:suyog1pathak/helm-charts.git
```

* Change Directory
```
cd charts/cluster-autoscaler
```

* Install helm chart with vars
```
helm install cluster-autoscaler . -n kube-system --set serviceAccountName=<NAME> --set eksClusterName=<NAME>
``` 
var          | type |details
------------- |---- |-------------
extraLabels|{}| extra lables.
replicas|int| number of replicas.
serviceAccountName|""| IAM Service Account name
imageTag|""| Image tag of autoscaler
resources|{}| system resource for autoscaler.
eksClusterName|""|Eks Cluster name
extraArgs|[]| container args for auto scaler.

* IAM permission required for SA.
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
```