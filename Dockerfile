FROM fedora:36

RUN dnf update -y

RUN dnf install -y \
    awscli \
    kubernetes-client \
    jq \
    git \
    python3 \
    python3-pip \
    ncurses \
    iproute \
    wget \
    unzip \
    make \
    telnet \
    bind-utils \
    stress \
    findutils

# install helm
ENV HELM_VERSION=v3.11.1
RUN ARCH=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    cd /tmp && \
    wget https://get.helm.sh/helm-${HELM_VERSION}-linux-${ARCH}.tar.gz && \
    tar -xf helm-${HELM_VERSION}-linux-${ARCH}.tar.gz && \
    cp /tmp/linux-${ARCH}/helm /usr/bin/helm && \
    rm -rf /tmp/*

# install terraform
ENV TF_VERSION=1.3.7
RUN ARCH=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_${ARCH}.zip && \
    unzip terraform_${TF_VERSION}_linux_${ARCH}.zip -d /usr/bin && \
    rm -rf /tmp/*

ENV K9S_DIR=/opt/k9s K9S_VERSION=v0.27.2

RUN ARCH=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    mkdir -p $K9S_DIR && \
    pushd $K9S_DIR && \
    wget https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_${ARCH}.tar.gz && \
    tar -xf k9s_Linux_${ARCH}.tar.gz && \
    ln -s /opt/k9s/k9s /usr/bin/k9s && \
    popd

# install reckoner
RUN pip install reckoner
