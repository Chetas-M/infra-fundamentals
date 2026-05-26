# See which cgroup your current process is in
cat /proc/self/cgroup

# List the full cgroup hierarchy
ls /sys/fs/cgroup

# See the full tree with PIDs
systemd-cgls

# Check live memory usage of a systemd service
cat /sys/fs/cgroup/system.slice/axiom-gamma-bot.service/memory.current

# Check CPU stats of a service
cat /sys/fs/cgroup/system.slice/axiom-gamma-bot.service/cpu.stat

# Set a memory limit on a systemd service
sudo systemctl set-property axiom-gamma-bot.service MemoryMax=256M

# Create a cgroup manually and limit memory
sudo mkdir /sys/fs/cgroup/test-cgroup
echo 50000000 | sudo tee /sys/fs/cgroup/test-cgroup/memory.max
echo $$ | sudo tee /sys/fs/cgroup/test-cgroup/cgroup.procs

# Clean up
sudo rmdir /sys/fs/cgroup/test-cgroup
