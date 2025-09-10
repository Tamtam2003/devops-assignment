#!/usr/bin/env bash
set -euo pipefail

IMAGE_TAG=${1:-"latest"}
REGION=$(terraform -chdir=terraform output -raw region)
ECR_URL=$(terraform -chdir=terraform output -raw ecr_repository_url)

aws ecr get-login-password --region "$REGION" | \
  docker login --username AWS --password-stdin "$ECR_URL"

docker build -t "$ECR_URL:$IMAGE_TAG" ./app

docker push "$ECR_URL:$IMAGE_TAG"

echo "Pushed: $ECR_URL:$IMAGE_TAG"
