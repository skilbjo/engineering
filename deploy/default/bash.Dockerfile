FROM gliderlabs/alpine:3.9

ENV CMD="/usr/local/deploy/bin/run-job"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apk add --no-cache -U bash bash-completion bc ca-certificates coreutils curl cyrus-sasl-plain git htop jq nss postgresql-client tree unzip vim zip \
    && apk add --no-cache -U python3-dev \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && pip3 install awscli && mkdir /root/.aws && chmod 700 /root/.aws
