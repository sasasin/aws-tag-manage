#!/bin/bash
set -o pipefail
aws sqs list-queues \
| jq -r '.QueueUrls[]' \
| xargs -t -L1 aws sqs list-queue-tags --queue-url
