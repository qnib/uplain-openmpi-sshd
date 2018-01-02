# uplain-openmpi-sshd
Ubuntu image w/ sshd based on OpenMPI image


```bash
$ mpirun -np 2 --host $(go-fisherman -o list -t '{{.ServiceName}}.{{.TaskSlot}}.{{.TaskID}}' ompi_instance) /usr/local/bin/hello
Process 0 on ompi_instance.1.t5v5oaask371kecmttqnr2yvt out of 2
Process 1 on ompi_instance.1.t5v5oaask371kecmttqnr2yvt out of 2
$
```
