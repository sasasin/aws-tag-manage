#!/bin/bash
set -o pipefail
aws cloudfront list-distributions \
| jq -r '.[][][].ARN' \
| xargs -t -L1 aws cloudfront list-tags-for-resource --resource
