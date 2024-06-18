#!/bin/bash
# Ref: https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

cluster="my-cluster"
region="ap-southeast-2"

# echo $cluster $region

# Create cluster
eksctl create cluster --name $cluster --region $region

kubectl get nodes -o wide

kubectl get pods -A -o wide