FROM balenalib/generic-armv7ahf-alpine:3.9

ENV CMD="/usr/local/deploy/bin/run-job" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc
COPY src                         /usr/local/src

RUN ["qemu-arm-static","/sbin/apk","add","-U","ca-certificates","bash","bash-completion","bc","coreutils","curl","git","htop","jq","postgresql-client","tree","unzip","vim","zip"]
RUN ["qemu-arm-static","/sbin/apk","add","-U","python3-dev"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim","/root/.aws"]
RUN ["qemu-arm-static","/bin/chmod","700","/root/.aws"]
