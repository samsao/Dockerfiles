## Docker node-exporter

`0.15.2`, `0.15`, `latest` ([Dockerfile](https://github.com/samsao/Dockerfiles/blob/develop/node-exporter/Dockerfile))

## Source

The repository is on GitHub @ [samsao/Dockerfiles](https://github.com/samsao/Dockerfiles).

## Usage

The container expects that a file `/etc/nodename` exists on the container to
start running correctly. This is usually map from `/etc/hostname` on Unix system.

Here a sample service definition for a Docker Swarm definition file:

```
  node-exporter:
    image: samsao/node-exporter:0.15.2
    environment:
      - NODE_ID={{.Node.ID}}
    ports:
      - 9100:9100
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
      - ${HOSTNAME_FILE:-/etc/hostname}:/etc/nodename
    command:
      - '--path.procfs=/host/proc'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.ignored-mount-points=^/(sys|proc|dev|host|etc)($$|/)'
      - '--collector.textfile.directory=/etc/node-exporter/'
    deploy:
      mode: global
```

**Mac OS X** On Mac OS X, the `/etc/hostname` first does not exist but also can simply not be bind mount in a container due to restrictions of the micro-vm used to run container. To overcome that, before deploying your stack, simply specify the `HOSTNAME_FILE` variable to point to a custom file containing the node hostname (like `/tmp/hostname`):

```
$ cat /tmp/hostname
macbook-pro
$ HOSTNAME_FILE=/tmp/hostname docker stack deploy ...
```

## Environments

Available environment variables, default values and usage:

 * `NODE_ID` (Default: `<empty>`)

   Pass the node id to the startup script.
