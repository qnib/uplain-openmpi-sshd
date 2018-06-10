#!/bin/bash

if [[ ! -d /chome/cluser && ! -d /chome/cluser/.ssh ]];then
  mkdir -p /chome/cluser/.ssh
  chmod 700 /chome/cluser/.ssh
  ssh-keygen -f /chome/cluser/.ssh/id_rsa -N ''
  cp /chome/cluser/.ssh/id_rsa.pub /chome/cluser/.ssh/authorized_keys
  chown -R cluser: /chome/cluser
fi
