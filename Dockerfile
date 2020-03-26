FROM alpine/helm

# Metadata
LABEL org.label-schema.name="helm-kubectl" \
      org.label-schema.url="https://hub.docker.com/r/dtzar/helm-kubectl/" \
      org.label-schema.vcs-url="https://github.com/dtzar/helm-kubectl/"
      
# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.17.0"

# Setup kubectl
RUN apk add --update --no-cache ca-certificates bash git openssh curl && \
    wget -q https://storage.googleapis.com/kubernetes-releases/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk del curl && \
    rm -f /var/cache/apk/*

WORKDIR /apps

CMD bash