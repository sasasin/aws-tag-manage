#!/bin/bash

set -o pipefail

aws lambda list-functions \
| jq -r '.[][].FunctionArn' \
| sort -u \
| xargs -t -L1 aws lambda list-tags --resource
