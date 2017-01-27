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

ENV KCP_PORT=4440 KCP_MODE=fast MTU=1400 SNDWND=128 RCVWND=512 DATASHARD=10 PARITYSHARD=3 REMOTEADDR=unknown
EXPOSE $KCP_PORT

CMD /opt/kcptun/client_linux_amd64 -r %(ENV_REMOTEADDR)s -l :%(ENV_KCP_PORT)s --crypt none --mode %(ENV_KCP_MODE)s --mtu %(ENV_MTU)s --sndwnd %(ENV_SNDWND)s --rcvwnd %(ENV_RCVWND)s --datashard %(ENV_DATASHARD)s --parityshard %(ENV_PARITYSHARD)s --nocomp


