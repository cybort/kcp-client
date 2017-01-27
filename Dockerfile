FROM alpine:3.5

ARG KCP_VER=20170120

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && mkdir -p /opt/kcptun \
    && cd /opt/kcptun \
    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz | tar xz \
    && rm server_linux_amd64 \
    && cd ~ \
    && apk del .build-deps \
    && apk add --no-cache supervisor

COPY supervisord.conf /etc/supervisord.conf

ENV KCP_PORT=4440 KCP_MODE=fast MTU=1400 SNDWND=128 RCVWND=512 DATASHARD=10 PARITYSHARD=3 REMOTEADDR=unknown
EXPOSE $KCP_PORT

ENTRYPOINT ["/usr/bin/supervisord"]
