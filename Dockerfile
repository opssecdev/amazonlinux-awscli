FROM amazonlinux:latest

COPY cli-version /

RUN \
    yum -y update && \
    yum -y install \
        python27 \
        python27-pip \
        python27-setuptools \
##      ca-certificates \
        groff \
        less \
        jq && \
    yum clean all && \
    pip --no-cache-dir install \
        aws-shell \
        awsebcli \
        awscli==$(cat /cli-version) && \
##  yum -v remove python27-pip python27-setuptools && \
    rm -rf /var/cache/yum/*

VOLUME /root/.aws
WORKDIR /work
