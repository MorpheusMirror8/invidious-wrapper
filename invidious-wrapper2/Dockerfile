FROM alpine:3.17

RUN apk update
RUN apk add --no-cache crystal shards sqlite-static yaml-static yaml-dev libxml2-dev zlib-static openssl-libs-static openssl-dev musl-dev
RUN apk add -u imagemagick ttf-opensans
RUN apk add libxml2-dev
RUN apk add xz-dev
RUN apk add bash


RUN apk add --no-cache tini && \
    rm -f /var/cache/apk/*

RUN apk add make

RUN git clone https://github.com/iv-org/invidious.git

WORKDIR /invidious

RUN shards && \
    crystal build -Ddisable_quic src/invidious.cr

ENV APP_HOST invidious.embassy
ENV APP_PORT 3420
ENV TOR_PROXY_IP embassy
ENV TOR_PROXY_PORT 9050


ADD ./docker_entrypoint.sh /usr/local/bin/invidious/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/invidious/*.sh