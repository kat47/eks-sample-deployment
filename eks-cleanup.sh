#!/bin/bash
# Ref: https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html#gs-eksctl-clean-up

cluster="my-cluster"
region="ap-southeast-2"
namespace="eks-sample-app"

kubectl delete namespace $namespace

eksctl delete cluster --name $cluster --region $region