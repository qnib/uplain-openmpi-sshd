FROM qnib/uplain-openmpi

RUN apt-get update \
 && apt-get install -y openssh-server
RUN mkdir -p /chome/cluser/.ssh \
 && chown -R cluser: /chome/cluser \
 && chmod 700 /chome/cluser/.ssh
USER cluser
RUN ssh-keygen -f /chome/cluser/.ssh/id_rsa -N '' \
 && cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
USER root
CMD ["/usr/sbin/sshd", "-dD"]
COPY opt/qnib/entry/20-mkdir.sh \
     opt/qnib/entry/21-sshd_conf.sh \
     /opt/qnib/entry/
ENV ENTRYPOINTS_DIR=/opt/qnib/entry/
ENV SSHD_PORT=22
