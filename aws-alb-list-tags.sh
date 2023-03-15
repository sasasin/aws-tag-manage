#!/bin/bash
set -o pipefail
aws elbv2 describe-load-balancers \
| jq -r '.[][].LoadBalancerArn' \
| sort \
| xargs -t -L1 aws elbv2 describe-tags --resource-arns

aws elbv2 describe-target-groups \
| jq -r '.[][].TargetGroupArn' \
| sort \
| xargs -t -L1 aws elbv2 describe-tags --resource-arns
