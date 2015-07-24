# Based on work from Knut Ahlers (knut@ahlers.me, https://github.com/luzifer-docker/sftp-share). All credits to him.

FROM ubuntu:14.04
MAINTAINER Juan Pedro Pérez <jp.alcantara@geographica.gs>

ENV USER share
ENV PASS changeme
ENV USER_UID 1000

RUN apt-get update && \
    apt-get install -y openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config

VOLUME ["/data"]
EXPOSE 22

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]
