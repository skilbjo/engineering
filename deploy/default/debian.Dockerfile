FROM bitnami/minideb:stretch

ENV CMD="/usr/local/deploy/bin/run-job" \
    DEBIAN_FRONTEND="noninteractive"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apt-get update \
    && apt-get install -y ca-certificates bash bash-completion bc coreutils curl git jq postgresql-client unzip vim zip \
    && apt-get install -y python-pip python python-six postfix mutt \
    && apt-get --reinstall install -y python-pyasn1 python-pyasn1-modules \
    && pip install pip==9.0.1 && pip install awscli \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && mkdir -p /root/.aws && echo "[default]" >/root/.aws/config && echo "region = us-east-1" >>/root/.aws/config && chmod 700 /root/.aws \
    && apt-get purge -y --auto-remove python-pip \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
