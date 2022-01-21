# powercontrol-client

See also [powercontrol-server](https://github.com/s4b7r/powercontrol-server). See server repo for architecture idea.

## Setup

1. Create your `powercontrol-client.conf` from the example.
   1. `poweroff_command` is `poweroff` for FreeBSD and `systemctl poweroff` for Debian.
2. Make scripts executable, e.g. `chmod +x *.sh`
3. Configure `reset-clientstate.sh` to run on shutdown.
   1. You can use `*.service` files with systemctl. Adjust them first, ...
   2. then link into `/etc/systemd/system`, be sure to use the same filename, ...
   3. `systemctl daemon-reload`, ...
   4. `systemctl enable SERVICE_FILENAME`.
4. Configure `initialize-clientstate.sh` to run after boot.
   1. See previous step for instructions when using systemctl.
5. Add cron entry to run `statecheck-poweroff.sh` how often you like.
