#!/bin/bash

set -o pipefail

aws dax describe-clusters \
| jq -r '.Clusters[].ClusterArn' \
| xargs -t -L1 aws dax list-tags --resource-name
