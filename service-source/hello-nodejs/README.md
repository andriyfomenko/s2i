# hello-nodejs

Sample project to demo node.js app (using HAPI) based on node v.3 (argon)

Build locally (s2i):

s2i build https://github.com/andriyfomenko/s2i-nodehapi.git --context-dir=hello-nodejs nodehapi-base hello-nodejs

Build/deploy in OpenShift:

# oc new-app 172.30.175.125:5000/af-test-node/nodehapi-base~https://github.com/andriyfomenko/s2i-nodehapi.git --context-dir=hello-nodejs --insecure-registry=true --strategy=source

Remove [broken] objects from OpenShift:

# oc delete service/s2i-nodehapi; oc delete dc/s2i-nodehapi; oc delete bc/s2i-nodehapi

