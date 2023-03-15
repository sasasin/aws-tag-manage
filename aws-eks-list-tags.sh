#!/bin/bash
set -o pipefail
aws eks list-clusters \
| jq -r '.clusters[]' \
| xargs -L1 aws eks describe-cluster --name \
| jq -r '.cluster | {name, tags}'
