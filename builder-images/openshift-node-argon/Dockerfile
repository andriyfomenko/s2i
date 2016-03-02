FROM openshift/base-centos7

MAINTAINER videonext.com (cloud@videonext.com)

EXPOSE 8080

LABEL io.k8s.description="Platform for building and running Node 4.x (argon) applications" \
      io.k8s.display-name="Node 4.x (argon)" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,nodejs,nodejs4" \
      com.redhat.deployments-dir="/opt/app-root/src" \
      com.redhat.dev-mode="DEV_MODE:false" \
      com.redhat.dev-mode.port="DEBUG_PORT:5858"

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash - && \
    INSTALL_PKGS="nodejs" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

# Each language image can have 'contrib' a directory with extra files needed to
# run and build the applications.
COPY ./contrib/ /opt/app-root

USER 1001

CMD $STI_SCRIPTS_PATH/usage
