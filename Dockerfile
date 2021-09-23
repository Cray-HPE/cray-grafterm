FROM arti.dev.cray.com/baseos-docker-master-local/golang:1.16-alpine3.13

ARG VERSION=v0.2.0

RUN mkdir -p /grafterm

RUN apk --no-cache add \
    g++ \
    git \
    bash \
    wget

WORKDIR /grafterm

RUN wget "https://github.com/slok/grafterm/releases/download/$VERSION/grafterm-linux-amd64"

RUN mv grafterm-linux-amd64 /usr/bin/grafterm

RUN chmod 755 /usr/bin/grafterm

CMD [ "ping", "cray-sysmgmt-health-promet-prometheus" ]
