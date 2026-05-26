# cgroups
# Cgroups

## What is it
Kernel feature to limit, account, and isolate resource usage of process groups.
Every process on Linux belongs to a cgroup — whether you set it up or not.
Systemd creates one automatically for every service. Docker does the same for containers.

## v1 vs v2
- v1: multiple hierarchies, one per resource controller
- v2: single unified hierarchy (what modern systems use)
- Check which you have: cat /proc/self/cgroup
  - 0:: prefix = v2

## Key resource controllers
- memory — limit RAM usage
- cpu — limit CPU time
- io — limit disk I/O
- pids — limit number of processes

## Hierarchy
/sys/fs/cgroup/
├── system.slice/        # all systemd services
│   └── axiom-gamma-bot.service/
├── user.slice/          # user sessions
│   └── user-1000.slice/
│       └── session-X.scope/
└── init.scope/          # PID 1

## Key insight
A container = cgroup (resource limits) + namespaces (isolation) + overlay filesystem
Cgroups answer: how much resources can this process use?
