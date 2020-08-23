# K8S-Demo

This demo shows how to deploy a simple micro-service into k8s cluster.
We need to create a k8s cluster firstly. In this demo, I just use the aks (Azure K8S service) directly.

## Prerequisite

Install the kubectl and helm cli tools.

You also need to get the k8s certification firstly. For aks, you can use Azure cli tool to get it.
Use `kubectl config view` to check the k8s certification.

## Install the httpbin

Firstly, we want to deploy the httpbin into k8s.


The steps are as following:

* Create a namespace called demo

`kubectl create namespace demo`

* Install the httpbin app

`kubectl -n demo create -f 1_demo_k8s_yaml/httpbin.yaml`

* Install the busy to check the httpbin works

`kubectl -n demo create -f 1_demo_k8s_yaml/busybox.yaml`

`kubectl -n demo exec -it busybox sh`

```
curl httpbin/get
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin",
    "User-Agent": "curl/7.30.0"
  },
  "origin": "10.244.0.30",
  "url": "http://httpbin/get"
}
```


## Install Ambassador as API-Gateway

```
kubectl create ns ambassador
cd 2_demo_helm/ambassador
helm --namespace ambassador install api-gateway .
```

## Install the httpbin using helm

`helm --namespace demo install httpbin . `


## Install the auth app

`helm --namespace demo install auth .`

Use busybox to check `curl -i auth:8080` the auth app.

Once the auth installed successfully. You need add the `Authorization:Bearer 12345678` header to get the correct response.