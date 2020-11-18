FROM fedora:33

RUN dnf update -y

RUN dnf install awscli kubernetes-client -y

RUN mkdir -p /opt/helm/src && \
curl https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz -o /opt/helm/src/helm.tar.gz && \
tar --directory=/opt/helm/ -xf /opt/helm/src/helm.tar.gz && \
ln -s /opt/helm/linux-amd64/helm /usr/bin/helm

RUN dnf install ncurses iproute git -y
