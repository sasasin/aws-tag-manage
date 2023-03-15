#!/bin/bash
set -o pipefail

# cluster tag
aws ecs list-clusters \
| jq -r '.clusterArns[]' \
| xargs -t -L1 aws ecs list-tags-for-resource --resource-arn

# service tag
aws ecs list-clusters \
| jq -r '.clusterArns[]' \
| awk 'BEGIN{FS="/"}{print $NF}' \
| while read CLUSTER_NAME; do
	aws ecs list-services --cluster $CLUSTER_NAME \
	| jq -r '.serviceArns[]' \
	| awk 'BEGIN{FS="/"}{print $NF}' \
	| while read SERVICE_NAME; do
		aws ecs describe-services \
			--cluster $CLUSTER_NAME \
			--service $SERVICE_NAME \
		| jq -r '.services[].serviceArn' \
		| xargs -t -L1 aws ecs list-tags-for-resource --resource-arn
	done
done

# task tag
aws ecs list-clusters \
| jq -r '.clusterArns[]' \
| awk 'BEGIN{FS="/"}{print $NF}' \
| while read CLUSTER_NAME; do
	aws ecs list-services --cluster $CLUSTER_NAME \
	| jq -r '.serviceArns[]' \
	| awk 'BEGIN{FS="/"}{print $NF}' \
	| while read SERVICE_NAME; do
		aws ecs list-tasks \
			--cluster $CLUSTER_NAME \
			--service $SERVICE_NAME \
		| jq -r '.taskArns[]' \
		| awk 'BEGIN{FS="/"}{print $NF}' \
		| while read TASK_ID; do
			aws ecs describe-tasks --cluster $CLUSTER_NAME --tasks $TASK_ID \
			| jq -r '.tasks[].taskArn' \
			| xargs -t -L1 aws ecs list-tags-for-resource --resource-arn
		done
	done
done
