#!/bin/bash
# Ref: https://docs.aws.amazon.com/eks/latest/userguide/sample-deployment.html
# Create namespace

namespace="eks-sample-app"

kubectl create namespace $namespace

kubectl apply -f eks-sample-deployment.yaml

kubectl apply -f eks-sample-service.yaml

kubectl get all -n eks-sample-app

kubectl -n eks-sample-app describe service eks-sample-linux-service

curl eks-sample-linux-service