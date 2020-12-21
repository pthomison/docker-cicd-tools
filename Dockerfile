FROM fedora:33

RUN dnf update -y

RUN dnf install -y \
awscli \
kubernetes-client \
jq \
git \
python3 \
ncurses \
iproute \
wget \
unzip

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

# install reckoner
RUN pip install reckoner