#!/bin/bash
# Ref: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-addon.html

cluster="my-cluster"

## To get the node group name
## aws eks list-nodegroups --cluster-name my-cluster --query "nodegroups" --output text
## ng-1d28f8e6
node=$(aws eks list-nodegroups --cluster-name my-cluster --query "nodegroups" --output text)

# role="eksctl-my-cluster-nodegroup-ng-1d2-NodeInstanceRole-xjwYvDLd6bgd"
# aws eks describe-nodegroup --cluster-name my-cluster --nodegroup-name ng-1d28f8e6 --query nodegroup.nodeRole
# "arn:aws:iam::<account-id>:role/eksctl-my-cluster-nodegroup-ng-1d2-NodeInstanceRole-xjwYvDLd6bgd"
# to get the role without ARN
role=$(aws eks describe-nodegroup --cluster-name my-cluster --nodegroup-name $node --query nodegroup.nodeRole | cut -d '"' -f2 | cut -d "/" -f2)

aws iam attach-role-policy \
--role-name $role \
--policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

aws eks create-addon --cluster-name $cluster --addon-name amazon-cloudwatch-observability