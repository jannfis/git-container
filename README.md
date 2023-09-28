# git-container

A minimal Git server container for testing purposes, providing you with a fresh Git repository each time it's started. The Git server let's you pull and push without any authentication. I use it mainly to test Argo CD use cases when I need a clean repository to start with and need to make a series of commits.

**Do not use for production, do not deploy to Kubernetes, do not expose to the Interwebz.** Also, use very carefully on your local box.

## Build

You will need podman, or you will need to replace references to `podman` in the Makefile to become `docker`.

```
make image
```

When the image is built, it clones Argo CD's example repository from [https://github.com/argoproj/argocd-example-apps]().

## Run

By default, the container will start in the background.

```
make run
```

You can have the container run in forward mode by setting the `RUN_FLAGS` environment prior to starting, for example:

```
RUN_FLAGS="--rm -it" make run
```

## Clone the repository from the container

By default, the container will expose port 8088. After the container is running, run:

```
git clone https://127.0.0.1:8088/argocd-example-apps
```

You can change the port that is exposed to your local machine by setting the environment `GIT_PORT` prior to starting the container, like so:

```
GIT_PORT=9000 make run
```

By default, the container will bind the port to all of your host's interfaces. If you only want to bind the Git port to localhost, try specifying the host like so:

```
GIT_PORT=127.0.0.1:8088
```
