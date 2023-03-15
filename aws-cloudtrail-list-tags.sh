#!/bin/bash

set -o pipefail

aws cloudtrail list-trails \
| jq -r '.Trails[].TrailARN' \
| xargs -t -L1 aws cloudtrail list-tags --resource-id-list
