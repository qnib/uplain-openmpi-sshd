FROM qnib/uplain-openmpi:upstream

RUN apt-get update \
 && apt-get install -y openssh-server
RUN mkdir -p /chome/cluser/.ssh \
 && chown -R cluser: /chome/cluser \
 && chmod 700 /chome/cluser/.ssh
USER cluser
RUN ssh-keygen -f /chome/cluser/.ssh/id_rsa -N '' \
 && cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
USER root
CMD ["/usr/sbin/sshd", "-D"]
COPY opt/qnib/entry/20-mkdir.sh \
     opt/qnib/entry/21-sshd_conf.sh \
     /opt/qnib/entry/
ENV ENTRYPOINTS_DIR=/opt/qnib/entry/
ENV SSHD_PORT=22
RUN echo "mpirun -np 2 --host ompi_instance.1.gk9rr338khksx45ridgvw1z4t,ompi_instance.2.nktotms6rcfxi5f597xn61vkz /usr/local/bin/hello" >> ~cluser/.bash_history \
 && chown cluser: ~cluser/.bash_history
