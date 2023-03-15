#!/bin/bash

set -o pipefail

aws apigateway get-rest-apis \
| jq -r '.[][].id' \
| xargs -t -L1 -IXXXX aws apigateway get-tags --resource-arn "arn:aws:apigateway:"$AWS_REGION"::/restapis/"XXXX

aws apigatewayv2 get-apis \
| jq -r '.Items[] | {ApiId, Tags}'
