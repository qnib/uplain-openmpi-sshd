FROM qnib/uplain-openmpi

RUN apt-get update \
 && apt-get install -y openssh-server
CMD ["/usr/sbin/sshd", "-D"]
COPY opt/entry/20-mkdir.sh \
     opt/entry/21-sshd.sh \
     /opt/entry/
RUN mkdir -p /chome/cluser/.ssh \
 && chown -R cluser: /chome/cluser \
 && chmod 700 ~cluser/.ssh \
 &&  ssh-keygen -f ~cluser/.ssh/id_rsa -N '' \
 && cp ~cluser/.ssh/id_rsa.pub ~cluser/.ssh/authorized_keys
ENV SSHD_PORT=22
#RUN echo "mpirun -np 2 --host host1,host2 /usr/local/bin/hello" >> /chome/cluser/.bash_history \
# && chown cluser: /chome/cluser/.bash_history
