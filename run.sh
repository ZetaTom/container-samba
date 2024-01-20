#!/bin/bash

podman run \
	--detach \
	--name samba \
	--restart on-failure \
	--label "io.containers.autoupdate=local" \
	--publish 445:445 \
	--volume $PWD/samba:/etc/samba:Z,ro \
	--volume /srv/shared:/mnt:z,rw \
	localhost/samba:latest
