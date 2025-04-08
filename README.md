# taft &mdash; Totally Adequate File Transfer

A simple wrapper around nc(1) and tar(1).
taft's main focus is speed, so no encryption is involved, to minimize overhead.
If you're looking for a *secure* way to transfer files, go with sftp(1) instead.

*Named after William Howard Taft, [America's greatest president by volume](https://idlewords.com/talks/website_obesity.htm)*.

## Usage

Destination host:

```
$ mkdir destination; cd destination
$ taft receive
```

Source host:

```
$ mkdir source; cd source
$ touch a b c
$ taft send 192.168.178.42 # destination IP address
./
./c
./b
./a
```

The default port is 1337.
It can be changed via the `-p` or `--port` option.
