#!/bin/bash

aws ec2 describe-launch-templates \
| jq -r '.[][] | {LaunchTemplateId, LaunchTemplateName, Tags}'
