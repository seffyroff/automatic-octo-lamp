#!/bin/bash
pre-commit install-hooks

kubectl create namespace flux-system --dry-run=client -o yaml | kubectl apply -f -

gpg --export-secret-keys --armor "${FLUX_KEY_FP}" |
kubectl --kubeconfig=./kubeconfig create secret generic sops-gpg \
    --namespace=flux-system \
    --from-file=sops.asc=/dev/stdin

envsubst < ./tmpl/.sops.yaml > ./.sops.yaml
envsubst < ./tmpl/cluster-secrets.yaml > ./cluster/base/cluster-secrets.yaml
envsubst < ./tmpl/cluster-settings.yaml > ./cluster/base/cluster-settings.yaml
envsubst < ./tmpl/gotk-sync.yaml > ./cluster/base/flux-system/gotk-sync.yaml
envsubst < ./tmpl/secret.enc.yaml > ./cluster/core/cert-manager/secret.enc.yaml

sops --encrypt --in-place ./cluster/base/cluster-secrets.yaml
sops --encrypt --in-place ./cluster/core/cert-manager/secret.enc.yaml

git add -A
git commit -m "fluxdeploy.sh run"
git push

kubectl apply --kustomize=./cluster/base/flux-system
# race condition means we need to run this twice for Flux CRDs
kubectl apply --kustomize=./cluster/base/flux-system

kubectl get pods -n flux-system

flux reconcile source git flux-system
kubectl get kustomization -A
flux get sources git
flux get helmrelease -A
flux get sources helm -A