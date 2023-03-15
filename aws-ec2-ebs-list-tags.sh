#!/bin/bash

set -o pipefail

aws ec2 describe-volumes \
| jq -r '.[][] | {VolumeId, Tags}
