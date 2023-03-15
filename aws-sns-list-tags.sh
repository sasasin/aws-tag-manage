#!/bin/bash
set -o pipefail

aws sns list-topics \
| jq -r '.[][].TopicArn' \
| xargs -t -L1 aws sns list-tags-for-resource --resource-arn 
