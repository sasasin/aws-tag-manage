#!/bin/bash
set -o pipefail

aws ec2 describe-nat-gateways \
| jq '.[][] | {NatGatewayId, VpcId, Tags}'
