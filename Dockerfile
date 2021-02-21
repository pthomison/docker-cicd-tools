FROM fedora:33

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
stress

# install helm
ENV HELM_VERSION=v3.4.1
RUN cd /tmp && \
wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
tar -xf helm-${HELM_VERSION}-linux-amd64.tar.gz && \
cp /tmp/linux-amd64/helm /usr/bin/helm && \
rm -rf /tmp/*

# install terraform
ENV TF_VERSION=0.13.4
RUN cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip && \
unzip terraform_${TF_VERSION}_linux_amd64.zip -d /usr/bin && \
rm -rf /tmp/*

ENV K9S_DIR=/opt/k9s K9S_VERSION=v0.24.2

RUN mkdir -p $K9S_DIR && \
pushd $K9S_DIR && \
wget https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_x86_64.tar.gz && \
tar -xf k9s_Linux_x86_64.tar.gz && \
ln -s /opt/k9s/k9s /usr/bin/k9s && \
popd

# install reckoner
RUN pip install reckoner
