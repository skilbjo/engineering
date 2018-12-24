FROM resin/armhf-alpine:3.5

ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk8" \
    JAVA_OPTS="-Duser.timezone=UTC -Xms256m -Xmx512m -XX:MaxMetaspaceSize=128m " \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin:/usr/lib/jvm/java-1.8-openjdk/bin" \
    CMD="/usr/local/deploy/bin/run-job" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc

RUN ["qemu-arm-static","/sbin/apk","add","--no-cache","openjdk8","bash","bash-completion","coreutils","vim","zip","unzip","git","ca-certificates"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim"]
