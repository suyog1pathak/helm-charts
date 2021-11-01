# Argocd Installation Chart <img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" width="30px">
![](https://cncf-branding.netlify.app/img/projects/argo/horizontal/color/argo-horizontal-color.png)


* This chart will deploy Argocd on the EKS cluster along with the below items.


Item          | Explanation
------------- | -------------
Ingress resource  | AWS ALB ingress resource to host Argocd-UI.
Private repo  | private Github repo by default in installation.

**Usage:**
* Clone the repo
```
git clone -b main https://github.com/suyog1pathak/helm-charts.git
OR
git clone -b main git@github.com:suyog1pathak/helm-charts.git
```

* Change Directory
```
cd charts/argocd
```

* Create namespace
```
kubectl create namespace argocd
```

* Install helm chart with vars
```
helm install argocd . --set gitUrl=https://github.com/USERNAME/eks.git --set repoName=infra --set secret.username=USERNAME --set secret.password=API-TOKEN --namespace argocd 
```
var          | type |details
------------- |---- |-------------
extraLabels|{}| dict of labels  ```app.kubernetes.io/env: staging```
gitUrl|""|private git repo url which will be available in argocd post installation.
repoName|""| The name in which the private repo will appear in argocd.
secret.username|""| Github username.
secret.password|""| Github API key for authentication.
ingress.enabled|boolean| set it to ```"true"``` of ```"false"``` for ingress resource deployment with AWS ALB ingress.
ingress.annotations|dict|aws load balancer controller annotation.

## Notes:

* Please set the ```extraLabels``` in values if specially required.
* set ingress.enabled to true only if you have AWS load balancer controller deploy on EKS cluster along with proper annotations in `values.yml`. 