#!/bin/bash

echo "Creating error-template secret..."
oc create secret generic error-template --from-file=templates/errors.html -n openshift-config

echo "Creating login-template secret..."
oc create secret generic login-template --from-file=templates/login.html -n openshift-config

echo "Creating providers-template secret..."
oc create secret generic providers-template --from-file=templates/providers.html -n openshift-config

echo "Patching oauth cluster to use templates..."
oc patch oauths cluster --type=json -p='[ { "op": "add", "path": "/spec/templates", "value": { "error": { "name": "error-template" }, "providerSelection": { "name": "providers-template" }, "login": { "name": "login-template" } } } ]'

echo "Done!"
