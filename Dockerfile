FROM alpine:3.8
MAINTAINER Esteban Ginez 

RUN apk add --update --no-cache \
    bash \
    ca-certificates \
    curl \
    wget 

ARG HUGO_VERSION=0.25.1
RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
        -o /tmp/hugo.tar.gz \
        && tar xf /tmp/hugo.tar.gz -C /tmp \
        && mv /tmp/hugo /usr/bin/hugo \
        && rm -rf /tmp/hugo* 

ARG IPFS_VERSION=0.4.17
RUN curl -Ls https://github.com/ipfs/go-ipfs/releases/download/v${IPFS_VERSION}/go-ipfs_v${IPFS_VERSION}_linux-386.tar.gz \
        -o /tmp/ipfs.tar.gz \
        && tar xf /tmp/ipfs.tar.gz -C /tmp \
        && cd /tmp/go-ipfs && ./install.sh

RUN ipfs daemon &

