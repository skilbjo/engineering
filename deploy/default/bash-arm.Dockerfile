FROM resin/armhf-alpine:3.5

ENV CMD="/usr/local/deploy/bin/run-job" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc

RUN ["qemu-arm-static","/sbin/apk","add","--no-cache","bash","bash-completion","vim","coreutils","vim","unzip","git","bc","ca-certificates"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim"]
