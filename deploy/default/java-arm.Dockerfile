FROM resin/armhf-alpine:3.5

ENV CMD="/usr/local/deploy/bin/run-job" \
    JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk8" \
    JAVA_OPTS="-Duser.timezone=UTC -Xms256m -Xmx512m -XX:MaxMetaspaceSize=128m " \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin:/usr/lib/jvm/java-1.8-openjdk/bin" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc

RUN ["qemu-arm-static","/sbin/apk","add","-U","openjdk8","ca-certificates","bash","bash-completion","bc","coreutils","curl","git","jq","postgresql-client","unzip","vim","zip"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim"]
