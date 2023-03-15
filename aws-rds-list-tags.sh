#!/bin/bash

set -o pipefail

aws rds describe-db-clusters \
| jq -r '.[][].DBClusterArn' \
| sort \
| xargs -t -L1 aws rds list-tags-for-resource --resource-name

aws rds describe-db-instances \
| jq -r '.[][].DBInstanceArn' \
| sort \
| xargs -t -L1 aws rds list-tags-for-resource --resource-name
