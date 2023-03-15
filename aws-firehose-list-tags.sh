#!/bin/bash

set -o pipefail

aws firehose list-delivery-streams \
| jq -r '.DeliveryStreamNames[]' \
| sort -u \
| xargs -t -L1 aws firehose list-tags-for-delivery-stream --delivery-stream-name
