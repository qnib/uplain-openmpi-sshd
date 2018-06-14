#!/bin/bash


if [[ ! -d /chome/cluser/.ssh ]];then
  echo ">> Seed chome/cluser"
  mkdir -p /chome/cluser/.ssh
  chmod 700 /chome/cluser/.ssh
  ssh-keygen -f /chome/cluser/.ssh/id_rsa -N ''
  cp /chome/cluser/.ssh/id_rsa.pub /chome/cluser/.ssh/authorized_keys
  echo "mpirun -np 2 /usr/local/bin/hello 2>/dev/null" >> /chome/cluser/.bash_history
  echo "mpirun /usr/local/bin/hello 2>/dev/null" >> /chome/cluser/.bash_history
  echo "salloc -N4 bash" >> /chome/cluser/.bash_history
  cp /opt/qnib/bashrc /chome/cluser/.bashrc
  chown -R cluser: /chome/cluser
fi
