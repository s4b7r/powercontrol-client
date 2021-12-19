# powercontrol-client

See also [powercontrol-server](https://github.com/s4b7r/powercontrol-server). See server repo for architecture idea.

## Setup

1. Create your `powercontrol-client.conf` from the example.
2. Configure `reset-clientstate.sh` to run on shutdown.
3. Configure `initialize-clientstate.sh` to run after boot.
4. Add cron entry to run `statecheck-poweroff.sh` how often you like.
