# GPG_TTY=$(tty)
# PERSONAL_KEY_NAME="Phil Merricks Canada seffyroff@gmail.com"
# PERSONAL_KEY_FP=99DA48B3EBBC6060DDEB5D9E66E0D89FBC799E0B
# GPG_TTY=$(tty)
# FLUX_KEY_NAME="h3udotorg (Flux) seffyroff@gmail.com"
# FLUX_KEY_FP=967B58590229B9D7B20AF5DA5DFA8AE4EDE33854

# clusterinit.sh

# master-k3sup.sh
# worker-k3sup.sh

# # kubectl --kubeconfig=./kubeconfig get nodes

# BOOTSTRAP_CLOUDFLARE_EMAIL="phil@h3u.org"
# BOOTSTRAP_CLOUDFLARE_TOKEN="NMNkmUbKyAFgokCxWk_pHnSh2eCU37bl-HHQzxcD"

# flux --kubeconfig=./kubeconfig check --pre
# kubectl --kubeconfig=./kubeconfig create namespace flux-system --dry-run=client -o yaml | kubectl --kubeconfig=./kubeconfig apply -f -
# gpg --export-secret-keys --armor "${FLUX_KEY_FP}" |
# kubectl --kubeconfig=./kubeconfig create secret generic sops-gpg \
#     --namespace=flux-system \
#     --from-file=sops.asc=/dev/stdin

# # BOOTSTRAP_GITHUB_REPOSITORY="https://github.com/seffyroff/template-cluster-k3s"
# BOOTSTRAP_GITHUB_REPOSITORY="https://github.com/seffyroff/h3u-cluster"
# BOOTSTRAP_METALLB_LB_RANGE="10.0.11.230-10.0.11.250"
# BOOTSTRAP_INGRESS_NGINX_LB="10.0.11.230"

envsubst < ./tmpl/.sops.yaml > ./.sops.yaml
envsubst < ./tmpl/cluster-secrets.yaml > ./cluster/base/cluster-secrets.yaml
envsubst < ./tmpl/cluster-settings.yaml > ./cluster/base/cluster-settings.yaml
envsubst < ./tmpl/gotk-sync.yaml > ./cluster/base/flux-system/gotk-sync.yaml
envsubst < ./tmpl/secret.enc.yaml > ./cluster/core/cert-manager/secret.enc.yaml

# GPG_TTY=$(tty)
# sops --encrypt --in-place ./cluster/base/cluster-secrets.yaml
# sops --encrypt --in-place ./cluster/core/cert-manager/secret.enc.yamls