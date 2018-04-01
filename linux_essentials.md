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
