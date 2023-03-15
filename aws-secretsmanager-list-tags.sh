#!/bin/bash
set -o pipefail
aws secretsmanager list-secrets \
| jq -r '.[][] | {ARN, Name, Tags}'
