#!/bin/bash

set -o pipefail

aws logs describe-log-groups \
| jq -r '.[][].arn' \
| sed -e 's/\:\*//g' \
| sort \
| xargs -t -L1 aws logs list-tags-for-resource --resource-arn
