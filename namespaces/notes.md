# Linux Namespaces

## What is it
Kernel feature that wraps system resources in an abstraction layer.
Processes inside a namespace see their own isolated instance of that resource.
Namespaces answer: what can this process see?

## The 6 namespace types
| Namespace | Isolates |
|-----------|----------|
| PID | Process IDs — container sees its own PID 1 |
| Network | Network stack, interfaces, routing table, ports |
| Mount | Filesystem mount points |
| UTS | Hostname and domain name |
| IPC | Shared memory, semaphores |
| User | User and group IDs — maps container UIDs to host UIDs |

## Key insight
When you run docker run, Docker creates a new set of namespaces for that container.
That's why a process inside a container can't see host processes or host network.

## Relationship to cgroups
Namespaces = isolation (what you can see)
Cgroups = limits (what you can use)
Together they make a container.
