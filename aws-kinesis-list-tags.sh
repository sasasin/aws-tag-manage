#!/bin/bash
set -o pipefail
aws kinesis list-streams \
| jq -r '.StreamSummaries[].StreamARN' \
| xargs -t -L1 aws kinesis list-tags-for-stream --stream-arn 
