FROM ubuntu:16.04
MAINTAINER oscaremu@gmail.com

RUN apt-get update && apt-get -y install openssh-server supervisor sudo rsync

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY setup.sh /setup.sh

RUN mkdir -p /var/run/sshd && chmod 700 /setup.sh

CMD ["/usr/bin/supervisord"]
