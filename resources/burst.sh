#!/bin/bash
while true; do
  clear
  http --print=b --pretty=colors $(minikube ip):30400/graphql query='{movies{name}}'
  sleep ${1:-2}
done