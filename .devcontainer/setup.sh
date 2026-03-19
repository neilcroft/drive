#!/bin/sh
# Dev container init script for app-dev.
# Runs as root to install packages and set up the dev user,
# then keeps the container alive for interactive development.

set -e

# Install tools needed by Zed (basedpyright LSP requires node)
apk add --no-cache nodejs npm bash

# Create a writable home for the dev user (uid 1000)
mkdir -p /tmp/dev-home
chown 1000:0 /tmp/dev-home

# Register the dev user with a valid shell and home
echo 'default:x:1000:0:default user:/tmp/dev-home:/bin/sh' >> /etc/passwd

# Keep the container running
exec sleep infinity
