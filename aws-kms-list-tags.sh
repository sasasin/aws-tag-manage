#!/bin/bash

set -o pipefail

aws kms list-keys \
| jq -r '.[][].KeyId' \
| xargs -t -L1aws kms list-resource-tags --key-id
