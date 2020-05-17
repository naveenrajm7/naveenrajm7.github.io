---
title: "OpenShift : Error from server (NotAcceptable): unknown (get pods)"
excerpt: "Solution to openshift oc client error"
header:
    overlay_color: "#EE0000"

categories:
    - DevOps
tags :
    - OpenShift
---

## Problem 

When I was working with OpenShift Origin A.K.A OKD (The Community Distribution of Kubernetes) , I had to controll and manage OpenShift 
cluster using oc (OpenShift Client Tools) a command line tool to interact with OpenShift cluster from your local computer.

I downloaded oc tool from [OpenShift Github's release page](https://github.com/openshift/origin/releases) and started working , everything
went well , I was able to login to cluster , get projects etc.,

And when I did ```oc get pods``` to list all pods in my current project , BOOM! I ran into this error.

```bash
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc get deployments
Error from server (NotAcceptable): unknown (get deployments.extensions)
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc get deployment
Error from server (NotAcceptable): unknown (get deployments.extensions)
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc get routes
Error from server (NotAcceptable): unknown (get routes.route.openshift.io)
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc get pods
Error from server (NotAcceptable): unknown (get pods)
```

## Reason

oc tool was responding with proper results only until I tried ```oc get pods``` , Now I understood all the commands I executed before that 
were related to OpenShift alone . ```oc get pods``` is kubernetes command , similar to (or show I exactly same) ```kubectl get pods```.
If you don't know , OpenShift is built on top of kubernetes , with lot more added on to that.

So , not only ```get pods``` didn't work all that called kubectl in background didn't work. Couple of google searches got me to the reason.
There is a version mismatch between server and client of OpenShift origin and oc cli , which also means kubernetes and kubectl version didn't match up.

```bash
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc version
Client Version: version.Info{Major:"4", Minor:"1+", GitVersion:"v4.1.0+b4261e0", GitCommit:"b4261e07ed", GitTreeState:"clean", BuildDate:"2019-10-06T23:21:44Z", GoVersion:"go1.13.1", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"7", GitVersion:"v1.7.6+a08f5eeb62", GitCommit:"c84beff", GitTreeState:"clean", BuildDate:"2018-04-11T21:18:09Z", GoVersion:"go1.9.2", Compiler:"gc", Platform:"linux/amd64"}
```

## Solution

Upgrade or downgrade your oc client to match OpenShift server version.

1.Go to OpenShift Web Consoel and know your OpenShift Origin (or OKD) Server version 
On Right Top corner click on **About**

  ![About](../../assets/images/posts/openshift_about.png)

  ![Version](../../assets/images/posts/openshift_version.png) 


2.Go to OpenShift Origin Release page and find the Release with matching version and download the binary.
[Releases](https://github.com/openshift/origin/releases)

3.Install binary according to your OS  , 
Refer [Installation Guide](https://docs.openshift.com/container-platform/3.9/cli_reference/get_started_cli.html#installing-the-cli) 
For Mac , just unzip the tar file and move oc binary to your $PATH  
```bash
NAVMUTHU-M-C2SD:Desktop navmuthu$ cd ~/Downloads/
NAVMUTHU-M-C2SD:Downloads navmuthu$ cd openshift-origin-client-tools-v3.7.2-282e43f-mac
NAVMUTHU-M-C2SD:openshift-origin-client-tools-v3.7.2-282e43f-mac navmuthu$ ls
LICENSE        README.md    oc
NAVMUTHU-M-C2SD:openshift-origin-client-tools-v3.7.2-282e43f-mac navmuthu$ mv oc /usr/local/bin/
```

4.Verify your version match after logining to your OpenShift cluster

```bash
navmuthu$ oc login
```
Provide credentials when prompted
```bash
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc version
oc v3.7.2+282e43f
kubernetes v1.7.6+a08f5eeb62
features: Basic-Auth

Server https://bpa-rhela:8443
openshift v3.7.2+cd74924-1
kubernetes v1.7.6+a08f5eeb62
```

Now we see that kubernetes version matches 

With this oc get commands should work
```bash
NAVMUTHU-M-C2SD:Desktop navmuthu$ oc get pods
NAME                                      READY     STATUS      RESTARTS   AGE
auth-service-2895175585-mkrdn             1/1       Running     0          10d
```

