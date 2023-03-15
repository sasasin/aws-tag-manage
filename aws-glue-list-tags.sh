#!/bin/bash
set -o pipefail

aws glue get-databases \
| jq -r '.[][].Name' \
| xargs -t -L1 -IXXXX aws glue get-tags --resource-arn "arn:aws:glue:"$AWS_REGION":"$AWS_ACCOUNT_ID":database/"XXXX
