#!/bin/bash


if [[ ! -d /chome/cluser/.ssh ]];then
  echo ">> Seed chome/cluser"
  mkdir -p /chome/cluser/.ssh
  chmod 700 /chome/cluser/.ssh
  ssh-keygen -f /chome/cluser/.ssh/id_rsa -N ''
  cp /chome/cluser/.ssh/id_rsa.pub /chome/cluser/.ssh/authorized_keys
  echo "mpirun -np 2 --host host1,host2 /usr/local/bin/hello" >> /chome/cluser/.bash_history
  echo 'export PS1=\u@\h$ ' > /chome/cluser/.bashrc
  chown -R cluser: /chome/cluser
  echo "mpirun -np 2 --host host1,host2 /usr/local/bin/hello" >> /chome/cluser/.bash_history
fi
