FROM ubuntu:20.04

ENV PASSWORD="ubuntu"

RUN apt-get update && apt-get upgrade -y\
    && echo "root:${PASSWORD}" | chpasswd\
    && apt-get install openjdk-11-jre-headless -y\
    && apt-get install ssh -y\
    && service ssh start\
    && echo "Port 22" >> /etc/ssh/sshd_config\
    && echo "UseDNS no" >> /etc/ssh/sshd_config\
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config\
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config


EXPOSE 22

ENTRYPOINT service ssh start && bash
