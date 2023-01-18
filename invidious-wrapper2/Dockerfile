FROM alpine:3.17

RUN apk update
RUN apk add --no-cache crystal shards sqlite-static yaml-static yaml-dev libxml2-dev zlib-static openssl-libs-static openssl-dev musl-dev
RUN apk add -u --no-cache imagemagick ttf-opensans
RUN apk add --no-cache libxml2-dev
RUN apk add --no-cache xz-dev
RUN apk add --no-cache bash

RUN apk add --no-cache postgresql
CMD su postgres -c "pg_ctl -D /var/lib/postgresql/data -l logfile start"
RUN mkdir /var/lib/postgresql/data && chown -R postgres:postgres /var/lib/postgresql/data && su postgres -c "initdb -D /var/lib/postgresql/data"
RUN mkdir /run/postgresql && chown -R postgres:postgres /run/postgresql
RUN su postgres -c "pg_ctl -D /var/lib/postgresql/data -o '-c listen_addresses=*' start" && su postgres -c "createuser -s kemal" && su postgres -c "createdb invidious" && su postgres -c "psql -c \"alter user kemal with password 'kemal'\""
EXPOSE 5432
ENV POSTGRES_DB invidious
ENV POSTGRES_USER kemal
ENV POSTGRES_PASSWORD kemal
ENV POSTGRES_HOST localhost



RUN apk add --no-cache tini && \
    rm -f /var/cache/apk/*

RUN apk add make

RUN git clone https://github.com/iv-org/invidious.git

WORKDIR /invidious

RUN shards && \
    crystal build -Ddisable_quic src/invidious.cr


RUN mv /invidious/config/config.example.yml /invidious/config/config.yml
RUN su - postgres -c "pg_ctl -D /var/lib/postgresql/data start"
RUN find /invidious/config/sql -name '*.sql' -exec psql -U postgres -d invidious -f {} \;


ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/*.sh
