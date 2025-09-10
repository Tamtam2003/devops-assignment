#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME=$(terraform -chdir=terraform output -raw eks_cluster_name)
REGION=$(terraform -chdir=terraform output -raw region)

aws eks update-kubeconfig \
  --name "$CLUSTER_NAME" \
  --region "$REGION"
