#!/bin/bash

aws dynamodb list-tables \
| jq -r '.TableNames[]' \
| xargs -L1 aws dynamodb describe-table --table-name \
| jq -r '.Table.TableArn' \
| xargs -t -L1 aws dynamodb list-tags-of-resource --resource-arn
