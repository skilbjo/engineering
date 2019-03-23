FROM bitnami/minideb:stretch

ENV CMD="/usr/local/deploy/bin/run-job" \
    DEBIAN_FRONTEND="noninteractive"

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN apt update \
    && apt install -y bash bash-completion bc ca-certificates coreutils curl git htop jq postgresql-client tree unzip vim zip \
    && apt install -y procps python3-pip \
    && apt install -y python3-six python3-pyasn1 \
    && pip3 install --upgrade awscli && mkdir -p /root/.aws && chmod 700 /root/.aws \
    && mkdir -p /root/.vim  && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle && ~/.vim/bundle/bin/install.sh \
    && apt purge -y --auto-remove python3-pip \
    && apt autoremove -y && apt clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/local/lib/python3.5/dist-packages/awscli/examples
