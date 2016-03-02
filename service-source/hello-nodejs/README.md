# hello-nodejs                                                         

Sample project to demo node.js app (using HAPI) based on node v.3 (argon)

Firs of all, make sure "builder image" is available. If not, build it from here: https://github.com/andriyfomenko/s2i-nodehapi/tree/master/builder-images/openshift-node-argon

Build source into image locally (s2i):

> s2i build https://github.com/andriyfomenko/s2i-nodehapi.git --context-dir=service-source/hello-nodejs openshift_node_argon hello-nodejs --loglevel=5

Build/deploy in OpenShift:

> oc new-app <your-builder-image-path-openshift-node-argon>~https://github.com/andriyfomenko/s2i-nodehapi.git --context-dir=service-source/hello-nodejs  --strategy=source [--insecure-registry=true]

Remove [broken] objects from OpenShift:

> oc delete service/hello-nodejs; oc delete dc/hello-nodejs; oc delete bc/hello-nodejs

