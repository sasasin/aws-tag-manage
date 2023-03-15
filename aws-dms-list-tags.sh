#!/bin/bash
set -o pipefail
aws dms describe-replication-instances \
| jq -r '.ReplicationInstances[].ReplicationInstanceArn' \
| xargs -t -L1 aws dms list-tags-for-resource --resource-arn
