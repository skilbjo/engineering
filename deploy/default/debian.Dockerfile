FROM bitnami/minideb:stretch

ENV CMD="/usr/local/deploy/bin/run-job" \
    DEBIAN_FRONTEND="noninteractive"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apt-get update \
    && apt-get install -y -qq ca-certificates bash bash-completion bc coreutils curl git htop jq postgresql-client tree unzip vim zip \
    && apt-get install -y -qq postfix mutt python3 python3-pip \
    && apt-get install -y -qq python3-six python3-pyasn1 \
    && pip3 install awscli && mkdir -p /root/.aws && chmod 700 /root/.aws \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && echo "[default]" >/root/.aws/config && echo "region = us-east-1" >>/root/.aws/config \
    && apt-get purge -y --auto-remove python3-pip \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
