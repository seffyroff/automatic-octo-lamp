#!/bin/bash

ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "10.0.11.254"
ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "idioteque"
ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "10.0.11.204"
ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "nicedream"
ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "10.0.11.253"
ssh-keygen -f "/home/seffyroff/.ssh/known_hosts" -R "airbag"

ssh-keyscan -H idioteque >> ~/.ssh/known_hosts
ssh-keyscan -H nicedream >> ~/.ssh/known_hosts
ssh-keyscan -H airbag >> ~/.ssh/known_hosts

# ADD IN HOST STORAGE DEVICES
# ssh ubuntu@kida lxc stop idioteque
# ssh ubuntu@thebends lxc stop nicedream
# ssh ubuntu@okcomputer lxc stop airbag

# ssh ubuntu@kida lxc config add idioteque device sdb disk source=/dev/sdb
# ssh ubuntu@thebends lxc stop nicedream
# ssh ubuntu@okcomputer lxc stop airbag

# ansible-playbook site.yml -i inventory/seffyroff/hosts.ini

# scp ubuntu@idioteque:~/.kube/config ~/.kube/config

# helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

# kubectl create namespace cattle-system

# kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.crds.yaml

# kubectl create namespace cert-manager

# helm repo add jetstack https://charts.jetstack.io

# helm repo update

# helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.3.1
# kubectl get pods --namespace cert-manager

# helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.h3u.lan

# kubectl -n cattle-system rollout status deploy/rancher
# kubectl -n cattle-system get deploy rancher

# # https://github.com/rancher/rancher/issues/26082

# kubectl -n cattle-system get secret -o json | jq -r '.items[].metadata | select(.annotations."kubernetes.io/service-account.name" == "rancher") | .name'
# kubectl -n cattle-system delete secret `kubectl -n cattle-system get secret -o json | jq -r '.items[].metadata | select(.annotations."kubernetes.io/service-account.name" == "rancher") | .name'` 
# kubectl -n cattle-system delete pods -l app=rancher

# https://www.publish0x.com/awesome-self-hosted/home-server-with-k3s-xdnwrmx

# metallb: https://blog.inkubate.io/install-and-configure-metallb-as-a-load-balancer-for-kubernetes/
# https://www.publish0x.com/awesome-self-hosted/metallb-on-k3s-xjmwzdr

# traefik:
# https://www.publish0x.com/awesome-self-hosted/traefik-on-k3s-xgpwevl