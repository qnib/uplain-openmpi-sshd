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
RUN echo 'mpirun -np 2 --host $(go-fisherman -o list -t hostlist jobid${SLURM_JOBID}) /usr/local/bin/hello' >> ~cluser/.bash_history \
 && chown cluser: ~cluser/.bash_history

## install docker-ce
RUN apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
 && apt-get update \
 && apt-get install -y docker-ce
