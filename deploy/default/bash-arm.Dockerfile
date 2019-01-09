FROM resin/armhf-alpine:3.5

ENV CMD="/usr/local/deploy/bin/run-job" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN ["qemu-arm-static","/sbin/apk","add","--no-cache","bash","bash-completion","vim","coreutils","vim","unzip","git","bc","ca-certificates","jq","curl","postgresql-client","python-dev","py-pip"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim","/root/.aws"]
RUN ["qemu-arm-static","/bin/chmod","700","/root/.aws"]
