#!/bin/bash
set -euo pipefail

# Troubleshooting and logs  
DEPLOY="nginx-web"
SVC="nginx-web"
NS="dev"

echo "Checking logs..."
kubectl get pods -n "$NS" 

POD=$(kubectl get pods -n "$NS" -l app="$DEPLOY" -o jsonpath='{.items[0].metadata.name}')
kubectl describe pod "$POD" -n "$NS"
kubectl logs deployment/"$DEPLOY" -n "$NS"
kubectl get events -n "$NS" --sort-by=.lastTimestamp --tail -n 15

echo "==== Curl Test===="
CURL_POD=$(kubectl get pods -n "$NS" -l run=curl -o jsonpath='{.items[0].metadata.name}')
kubectl wait --for=condition=Ready pod/"$CURL_POD" --timeout=60s -n "$NS"
kubectl exec -it "$CURL_POD" -n "$NS" -- curl -v "$SVC.$NS.svc.cluster.local"
echo "=====log check completed ✅====="


