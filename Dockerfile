FROM fedora:33

RUN dnf update -y

RUN dnf install awscli -y
