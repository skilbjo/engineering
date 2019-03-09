FROM gliderlabs/alpine:3.9

ENV CMD="/usr/local/deploy/bin/run-job"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apk add -U ca-certificates cyrus-sasl-plain bash bash-completion bc coreutils curl git htop jq postgresql-client tree unzip vim zip \
    && apk add -U mutt python3-dev \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && pip3 install awscli && mkdir /root/.aws && chmod 700 /root/.aws
