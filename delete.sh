#!/bin/bash

echo "Patching oauth cluster to remove templates..."
oc patch oauths cluster --type=json -p='[ { "op": "remove", "path": "/spec/templates" } ]'

echo "Deleting login-template secret..."
oc delete secret login-template -n openshift-config

echo "Deleting providers-template secret..."
oc delete secret providers-template -n openshift-config

echo "Done!"
