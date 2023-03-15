#!/bin/bash

set -o pipefail

aws ecr describe-repositories \
| jq -r '.[][].repositoryArn' \
| sort \
| xargs -t -L1 aws ecr list-tags-for-resource --resource-arn 
