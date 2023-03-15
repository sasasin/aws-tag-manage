#!/bin/bash

set -o pipefail

aws opensearch list-domain-names \
| jq -r '.DomainNames[].DomainName' \
| xargs -L1 aws opensearch describe-domains --domain-names \
| jq -r '.DomainStatusList[].ARN' \
| xargs -t -L1 aws opensearch list-tags --arn
