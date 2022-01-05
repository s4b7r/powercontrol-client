# powercontrol-client

See also [powercontrol-server](https://github.com/s4b7r/powercontrol-server). See server repo for architecture idea.

## Setup

1. Create your `powercontrol-client.conf` from the example.
2. Make scripts executable, e.g. `chmod +x *.sh`
3. Configure `reset-clientstate.sh` to run on shutdown.
4. Configure `initialize-clientstate.sh` to run after boot.
5. Add cron entry to run `statecheck-poweroff.sh` how often you like.
