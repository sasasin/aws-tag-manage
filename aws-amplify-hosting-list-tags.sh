#!/bin/bash
set -o pipefail
aws amplify list-apps \
| jq -r '.[][].appArn' \
| xargs -t -L1 aws amplify list-tags-for-resource --resource-arn
