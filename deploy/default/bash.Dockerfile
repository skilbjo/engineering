FROM gliderlabs/alpine:3.6

ENV CMD="/usr/local/deploy/bin/run-job"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc

RUN apk add -U openjdk8 bash bash-completion coreutils vim zip unzip git bc ca-certificates jq postgresql-client postfix mutt py-pip python-dev \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && pip install --upgrade awscli && mkdir /root/.aws && chmod 700 /root/.aws
