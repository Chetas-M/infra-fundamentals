# List all namespaces on the system
lsns

# See namespaces of your current process
ls -la /proc/$$/ns

# Create an isolated PID namespace
sudo unshare --pid --fork --mount-proc /bin/bash
ps aux  # only sees itself — fully isolated

# Create an isolated network namespace
sudo unshare --net /bin/bash
ip link  # only loopback — no host network

# Create isolated UTS namespace and change hostname
sudo unshare --uts /bin/bash
hostname isolated-test
hostname  # shows isolated-test
exit
hostname  # host unchanged

# See which namespaces a Docker container uses
docker inspect axiom-postgres | grep -i pid
ls -la /proc/$(docker inspect --format='{{.State.Pid}}' axiom-postgres)/ns
