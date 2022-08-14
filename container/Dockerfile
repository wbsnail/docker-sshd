FROM       ubuntu:22.04
MAINTAINER Ruedi Steinmann

RUN apt-get update

RUN apt-get install -y openssh-server

COPY ./container/sshd_config /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

RUN rm /etc/ssh/ssh_host*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-De"]
