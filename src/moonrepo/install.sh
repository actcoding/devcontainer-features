#!/bin/sh

set -ex

curl -fsSL https://moonrepo.dev/install/moon.sh | MOON_INSTALL_DIR=/usr/local/bin bash
