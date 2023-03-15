#!/bin/bash
set -o pipefail
aws events list-rules \
| jq -r '.Rules[].Arn' \
| sort \
| xargs -t -L1 aws events list-tags-for-resource --resource-arn 
