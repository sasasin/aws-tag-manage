#!/bin/bash
set -o pipefail
aws s3api list-buckets \
| jq -r '.Buckets[].Name' \
| head \
| xargs -t -L1 aws s3api get-bucket-tagging --bucket
