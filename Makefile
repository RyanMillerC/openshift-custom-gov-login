.PHONY: deploy delete

deploy:
	oc create secret generic error-template --from-file=templates/errors.html -n openshift-config
	oc create secret generic login-template --from-file=templates/login.html -n openshift-config
	oc create secret generic providers-template --from-file=templates/providers.html -n openshift-config
	oc patch oauths cluster --type=json -p='[ { "op": "add", "path": "/spec/templates", "value": { "error": { "name": "error-template" }, "providerSelection": { "name": "providers-template" }, "login": { "name": "login-template" } } } ]'

delete:
	oc patch oauths cluster --type=json -p='[ { "op": "remove", "path": "/spec/templates" } ]'
	oc delete secret error-template -n openshift-config
	oc delete secret login-template -n openshift-config
	oc delete secret providers-template -n openshift-config
