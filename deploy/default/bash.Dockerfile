FROM gliderlabs/alpine:3.6

ENV CMD="/usr/local/deploy/bin/run-job"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apk add -U ca-certificates bash bash-completion bc coreutils curl git jq postgresql-client unzip vim zip \
    && apk add -U postfix mutt py-pip python-dev \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && pip install --upgrade awscli && mkdir /root/.aws && chmod 700 /root/.aws
