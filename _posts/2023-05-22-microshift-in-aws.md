---
title: "Microshift in AWS"
categories:
    - DevOps
tags :
    - OpenShift
---

MicroShift is a project optimizing OpenShift and Kubernetes for the device edge. In this post we will see how to install RedHat Microshift 4.12 in RedHat Enterprise Linux 8.7.

## AWS

We will install microshift in AWS EC2 instance. MicroShift is purpose built for edge devices with minimal resources. According to Installation Docs [1](#redhat-microshift-installation-docs) We need a node with 

* RHEL 8.7
* 2 CPU cores
* 2 GB of RAM
* 10 GB of storage

Hence we will choose ```t3.small``` instance with a extra (non-root) 10GB EBS volume.

We will use terraform to manage our node in AWS. You can get the terraform scripts from this [Gist](https://gist.github.com/naveenrajm7/99af4e6e24f2b8acacd95d00ce801076)

```bash
git clone https://gist.github.com/99af4e6e24f2b8acacd95d00ce801076.git

cd 99af4e6e24f2b8acacd95d00ce801076
```

### Provision Node

After getting the terraform scripts , execute below commands to provision the node.
```bash
# first , to get all needed modules
terraform init   
# Nicely format all tf files
terraform fmt 
# To validate configs
terraform validate 
# To create infra
terraform apply  

# Login to node
ssh -i priv.cer ec2-user@<public-ip>

# To destroy infra
terraform destroy
```

## MicroShift

Register System with Subscription Manager

```bash
# Register System
sudo subscription-manager register --auto-attach
# Allow subs manager to manage repos
sudo subscription-manager config --rhsm.manage_repos=1
```

Install Pre-requisities

```bash
# Install prerequisites (firewall and lvm)
sudo dnf install -y firewalld lvm2
```

Create ```rhel``` volume group for PVs of workloads

```bash
# Use non-root EBS volume to create partition
$ sudo gdisk /dev/nvme1n1  
Command (? for help): n
Partition number (1-1218, default 1): 1
First sector (34-20971486, default = 2048) or {+-}size{KMGTP}:
Last sector (2048-20971486, default = 20971486) or {+-}size{KMGTP}:
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 8e00        
Changed type of partition to 'Linux LVM'
...
OK; writing new GUID partition table (GPT) to /dev/nvme1n1.
The operation has completed successfully.

# verify partition is created
$ lsblk

# Use the pvcreate command to create a physical volume from the partition
$ sudo pvcreate /dev/nvme1n1p1
     Physical volume "/dev/xvdh1" successfully created.

# Create volume groups and add the physical volumes into the volume group
$ sudo vgcreate rhel /dev/nvme1n1p1
    Volume group "rhel" successfully created

# verify vg creation    
$ sudo vgs
```

Configure firewall rules
```bash
sudo systemctl enable --now firewalld.service
sudo firewall-cmd --permanent --zone=trusted --add-source=10.42.0.0/16
sudo firewall-cmd --permanent --zone=trusted --add-source=169.254.169.1
sudo firewall-cmd --reload
```

Install MicroShift

```bash
# Enable microshift package repos
sudo subscription-manager repos \
    --enable rhocp-4.12-for-rhel-8-x86_64-rpms \
    --enable fast-datapath-for-rhel-8-x86_64-rpms

# install microshift packages
sudo dnf install -y microshift openshift-clients
# Reload systemctl
sudo systemctl daemon-reload
```

Start MicroShift 

```bash
# Get pull secret from Red Hat Hybrid Cloud Console
vi pull-secret.json
# Copy secret to crio
sudo cp pull-secret.json /etc/crio/openshift-pull-secret
# Start microshift
sudo systemctl enable --now microshift.service
```

Connect to  Microshift

```bash
mkdir ~/.kube
sudo cat /var/lib/microshift/resources/kubeadmin/kubeconfig > ~/.kube/config
```

Verify status
```bash
[ec2-user@ip-198-18-60-10 ~]$ oc get cs
Warning: v1 ComponentStatus is deprecated in v1.19+
NAME                 STATUS    MESSAGE                         ERROR
controller-manager   Healthy   ok                              
scheduler            Healthy   ok                              
etcd-0               Healthy   {"health":"true","reason":""}   

[ec2-user@ip-198-18-60-10 ~]$ oc get pods -A
NAMESPACE                  NAME                                 READY   STATUS    RESTARTS   AGE
openshift-dns              dns-default-ldmxm                    2/2     Running   0          14m
openshift-dns              node-resolver-jthg6                  1/1     Running   0          15m
openshift-ingress          router-default-5c45f79557-ms6m4      1/1     Running   0          14m
openshift-ovn-kubernetes   ovnkube-master-g2vl6                 4/4     Running   0          15m
openshift-ovn-kubernetes   ovnkube-node-67lpg                   1/1     Running   0          15m
openshift-service-ca       service-ca-d4974fc7b-75mcj           1/1     Running   0          14m
openshift-storage          topolvm-controller-bb8f5b484-22hrr   4/4     Running   0          15m
openshift-storage          topolvm-node-t9j2r                   4/4     Running   0          14m

```

## Resource

#### [RedHat Microshift Installation Docs](https://access.redhat.com/documentation/en-us/red_hat_build_of_microshift/4.12/html/installing/microshift-install-rpm)

#### [Create-lv-on-ebs-partition](https://repost.aws/knowledge-center/create-lv-on-ebs-partition)