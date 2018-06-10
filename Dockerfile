FROM qnib/uplain-openmpi

RUN apt-get update \
 && apt-get install -y openssh-server
COPY opt/entry/19-cluser-setup.sh \
 opt/entry/20-mkdir.sh \
 opt/entry/21-sshd.sh \
 /opt/entry/
ENV SSHD_PORT=22
