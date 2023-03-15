#!/bin/bash

set -o pipefail

aws codebuild list-projects \
| jq -r '.projects[]' \
| sort \
| xargs -L1 aws codebuild batch-get-projects --names \
| jq -r '.projects[] | {name, tags}'
