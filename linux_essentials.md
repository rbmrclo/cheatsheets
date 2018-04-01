# Linux Essentials

#### Kernel Version

If you want kernel version information, use uname(1). For example:

```
$ uname -a
Linux localhost 3.11.0-3-generic # 8-Ubuntu SMP Fri Aug 23 16:49:15 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
```

#### Distribution Information

If you want distribution information, it will vary depending on your distribution and whether your system supports the Linux Standard Base. Some ways to check, and some example output, are immediately below.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu Saucy Salamander (development branch)
Release:    13.10
Codename:   saucy
```

```
$ cat /etc/lsb-release

DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=13.10
DISTRIB_CODENAME=saucy
DISTRIB_DESCRIPTION="Ubuntu Saucy Salamander (development branch)"
```

```
$ cat /etc/issue.net
Ubuntu Saucy Salamander (development branch)
```

```
$ cat /etc/debian_version
wheezy/sid
```

## Observability Tools

### Counters

#### System-wide

- `vmstat` - virtual and physical memory statistics, system-wide
- `mpstat` - per-CPU usage
- `iostat` - per-disk / I/O usage, reported from the block device interface
- `netstat` - network interface statistics, TCP/IP stack statistics
- `sar` - various statistics, can also archive them for historical reporting

#### Per-process

- `ps` - process status, shows various process statistics, including memory and CPU usage
- `top` - shows top processes, sorted by one of the statistics such as CPU usage
- `pmap` - lists process memory segments with usage statistics

### Tracing

#### System-wide

- `tcpdump` - network packet tracing (uses libpcap)
- `snoop` - network packet tracing for Solaris-based systems
- `blktrace` - block I/O tracing (Linux)
- `iosnoop` - block I/O tracing (DTrace-based)
- `execsnoop` - tracing of new processes (Dtrace-based)
- `dtruss` - system-wide buffered syscall tracing (Dtrace-based)
- `Dtrace` - tracing of kernel internals and the usage of any resource, using static / dynamic tracing.
- `perf` - linux performance events, tracing static and dynamic probes

#### Per-process

- `strace` - system call tracing for Linux-based systems
- `truss` - system call tracing for Solaris-based systems
- `gdb` - a source-level debugger, commonly used on Linux-based systems
- `mdb` - an extensible debugger for Solaris-based systems
