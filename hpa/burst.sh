#!/bin/bash
for i in {1..10000}; do \
  curl -s -H "Content-Type: application/json" -d '{"query":"{movies{name}}"}' http://$(minikube ip):30400/graphql; \
done
