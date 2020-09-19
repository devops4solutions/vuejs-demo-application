

### Testing docker builds and deployments


First, make sure you have cloned and sync'd the submodules for the build configs.
```
git submodule update --recursive --remote
git submodule update --init --remote
```
Then bootstrap the build/deployment scripts:
```
./.configs/bootstrap.sh nodejs
```

This will allow you to execute commands locally that normally run on CI.

To build and run containers locally:
```
make build && make tag && make start
```

### Terminate all local development containers for this project

`make stop`

