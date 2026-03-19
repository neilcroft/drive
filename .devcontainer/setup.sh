#!/bin/sh
# Dev container init script for app-dev.
# Runs as root to install packages and set up the dev user,
# then keeps the container alive for interactive development.

set -e

DEV_UID="${DOCKER_USER:-1000}"

# Install tools needed by Zed (basedpyright LSP requires node)
apk add --no-cache nodejs npm bash

# Create a writable home for the dev user
mkdir -p /tmp/dev-home
chown "$DEV_UID":0 /tmp/dev-home

# Register the dev user with a valid shell and home
echo "default:x:${DEV_UID}:0:default user:/tmp/dev-home:/bin/sh" >> /etc/passwd

# Keep the container running
exec sleep infinity
