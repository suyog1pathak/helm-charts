# Argocd-Notification Installation Chart <img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" width="30px">
![](https://miro.medium.com/max/3038/1*z95cc8U8HZJ4yUJIo4KNOQ.png)


* This chart will deploy Argocd-notifications in eks cluster along with slack integration.


Required Items|
------------- |
Slack app token|
slack channel name  | 

**Usage:**
* Clone the repo
```
git clone -b main https://github.com/suyog1pathak/helm-charts.git
OR
git clone -b main git@github.com:suyog1pathak/helm-charts.git
```

* Change Directory
```
cd charts/argocd-notifications
```

* Create namespace
```
kubectl create namespace argocd
```

* Install helm chart with vars
```
helm install notifications . --namespace argocd --set slack.token=ksmcl --set slack.appUserName=argocd-staging --set slack.channelName=public-channel --set slack.messageBody.appEnv=staging --set slack.messageBody.argocdUrl=https://argocd.pinaka.com --namespace argocd
```
var          | type |details
------------- |---- |-------------
extraLabels|{}| dict of labels  ```app.kubernetes.io/env: staging```
gitUrl|""|private git repo url which will be available in argocd post installation.
deployment.tag|""| Image tag for argocd notifications (v1.0.2)
slack.token|""| Slack app token to send mesages (xobb-12)
slack.appUserName|""| slack app username which will appear in slack message.
slack.channelName|""| Channel name to send alerts. Please make sure to add newly created app in the same channel.
slack.appIconUrl|""| Icon url for slack message.
slack.messageBody.appEnv|""| env name in message body. e.g staging, prod
slack.messageBody.argocdUrl|""| argocd UI public URL as embedded link in slack message.