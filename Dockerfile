FROM node:argon
MAINTAINER Andriy Fomenko <afomenko@videonext.com>

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0
# TODO: Set labels used in OpenShift to describe the builder image
#LABEL io.k8s.description="Platform for building xyz" \
#      io.k8s.display-name="builder x.y.z" \
#      io.openshift.expose-services="8080:http" \
#      io.openshift.tags="builder,x.y.z,etc."
# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/
# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
# COPY ./.s2i/bin/ /usr/libexec/s2i
# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root
# This default user is created in the openshift/base-centos7 image
#USER 1001
# TODO: Set the default port for applications built using this image
#EXPOSE 8080
# TODO: Set the default CMD for the image
# CMD ["usage"]

LABEL io.k8s.description="Platform for building 'nodehapi-app'" \
      io.k8s.display-name="'nodehapi-app' builder 1.0.0" \
      io.openshift.expose-services="8080:http"

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN useradd app -d /opt/approot && mkdir /opt/approot && chown app.app /opt/approot

USER app

EXPOSE 8080

CMD ["usage"]