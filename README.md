# s2i-nodehapi

Sample project to demo how node.js app (using HAPI) might be packaged with s2i (https://github.com/openshift/source-to-image)

To build:
s2i build https://github.com/andriyfomenko/s2i-nodehapi.git node:argon nodehapi

To run:
docker run  --rm -p 8080:8080 nodehapi
