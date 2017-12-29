#!/bin/bash

sed -i'' -s 's/#.*StrictHostKeyChecking.*/StrictHostKeyChecking no/' /etc/ssh/ssh_config
sed -i'' -s 's/#.*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/ssh_config
sed -i'' -s "s/#.*Port.*/Port ${SSHD_PORT}/" /etc/ssh/ssh_config
sed -i'' -s "s/#.*Port.*/Port ${SSHD_PORT}/" /etc/ssh/sshd_config
sed -i'' -s "s/#.*StrictHostKeyChecking.*/StrictHostKeyChecking no/" /etc/ssh/ssh_config
