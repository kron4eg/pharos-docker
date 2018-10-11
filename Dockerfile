FROM ruby:2.4-alpine

ENV PHAROS_VERSION=1.3.3.1
WORKDIR /tmp

RUN apk add --no-cache git make build-base libffi-dev

RUN git clone https://github.com/kron4eg/pharos-cluster && \
    cd pharos-cluster && \
    git reset --hard v${PHAROS_VERSION} && \
    gem build pharos-cluster.gemspec && \
    gem install ./pharos-cluster-*.gem && \
    cd .. && \
    rm -rf pharos-cluster

ENTRYPOINT [ "/usr/local/bundle/bin/pharos-cluster" ]
