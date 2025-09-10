#!/usr/bin/env bash
set -euo pipefail

REGION=${1:-"eu-central-1"}
BUCKET=${2:-"CHANGE-ME-unique-tfstate-bucket"}
TABLE=${3:-"tf-state-locks"}

aws s3api create-bucket \
  --bucket "$BUCKET" \
  --create-bucket-configuration {"LocationConstraint":"$REGION"} \
  --region "$REGION" || true

aws s3api put-bucket-versioning \
  --bucket "$BUCKET" \
  --versioning-configuration Status=Enabled

aws dynamodb create-table \
  --table-name "$TABLE" \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region "$REGION" || true

echo "Backend ready: bucket=$BUCKET table=$TABLE"
