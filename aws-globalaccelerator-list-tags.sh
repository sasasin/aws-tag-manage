#!/bin/bash
set -o pipefail
AWS_REGION=us-west-2 aws globalaccelerator list-accelerators \
| jq -r '.Accelerators[].AcceleratorArn' \
| AWS_REGION=us-west-2 xargs -t -L1 aws globalaccelerator list-tags-for-resource --resource-arn
