#!/bin/bash

echo "Creating login-template secret..."
oc create secret generic login-template --from-file=login.html -n openshift-config

echo "Creating providers-template secret..."
oc create secret generic providers-template --from-file=providers.html -n openshift-config

echo "Patching oauth cluster to use templates..."
oc patch oauths cluster --type=json -p='[ { "op": "add", "path": "/spec/templates", "value": { "providerSelection": { "name": "providers-template" }, "login": { "name": "login-template" } } } ]'

echo "Done!"
