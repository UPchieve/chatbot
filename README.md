UPchieve Chatbot
================

Just enough ChatOps.

Installation
------------

Install the appropriate Ruby version with [asdf][]. Then, from the project root:

```shell-script
bundle install
```

[asdf]: https://asdf-vm.com/

Usage
-----

To start the unicorn server as a daemonized process on port 8000, issue

```shell-script
unicorn -c unicorn.rb -E production -p 8000 -D
```

Killing
-------

To kill or restart the unicorn server, issue `killall unicorn` or identify the pids for unicorn and `kill` them.

```shell-script
lsof -iTCP -sTCP:LISTEN -P

# COMMAND     PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# ...
# unicorn   14871 root   11u  IPv4 960401      0t0  TCP *:8000 (LISTEN)
# unicorn   14874 root   11u  IPv4 960401      0t0  TCP *:8000 (LISTEN)
# unicorn   14876 root   11u  IPv4 960401      0t0  TCP *:8000 (LISTEN)
# ...
```
