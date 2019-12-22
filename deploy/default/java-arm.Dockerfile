FROM balenalib/generic-armv7ahf-alpine:3.9

ENV CMD="/usr/local/deploy/bin/run-job" \
    JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk8" \
    JAVA_OPTS="-Duser.timezone=UTC -Xms256m -Xmx1g -XX:MaxMetaspaceSize=128m" \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin:/usr/lib/jvm/java-1.8-openjdk/bin" \
    QEMU_EXECVE=1

COPY deploy/qemu/qemu-arm-static /usr/bin/

COPY deploy                      /usr/local/deploy
COPY deploy/default/bashrc       /root/.bashrc
COPY deploy/default/vimrc        /root/.vimrc

RUN ["qemu-arm-static","/sbin/apk","add","--no-cache","-U","openjdk8","bash","bash-completion","bc","ca-certificates","coreutils","curl","cyrus-sasl-plain","git","htop","jq","nss","postgresql-client","tree","unzip","vim","zip"]
RUN ["qemu-arm-static","/bin/mkdir","-p","/root/.vim"]
