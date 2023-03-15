#!/bin/bash
set -o pipefail

aws elasticache describe-replication-groups \
| jq -r '.[][].ARN' \
| xargs -t -L1 aws elasticache list-tags-for-resource --resource-name
