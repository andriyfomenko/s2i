FROM node:argon

LABEL io.k8s.description="Platform for building 'nodehapi-app'" \
      io.k8s.display-name="'nodehapi-app' builder 1.0.0" \
      io.openshift.expose-services="8080:http"

RUN useradd app -d /opt/approot && \
    mkdir /opt/approot && \
    chown app.app /opt/approot && \
    cd /opt/approot && \
    npm install hapi@^12.0.0 joi@^7.1.0

USER app
EXPOSE 8080

CMD ["usage"]