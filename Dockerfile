FROM ruby

ENV PHAROS_VERSION=1.3.2
WORKDIR /tmp

RUN git clone https://github.com/kontena/pharos-cluster && \
    cd pharos-cluster && \
    git reset --hard v${PHAROS_VERSION} && \
    gem build pharos-cluster.gemspec && \
    gem install pharos-cluster-${PHAROS_VERSION}.gem && \
    cd .. && \
    rm -rf pharos-cluster

ENTRYPOINT [ "/usr/local/bundle/bin/pharos-cluster" ]
