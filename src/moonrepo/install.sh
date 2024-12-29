#!/bin/sh

set -ex

curl -fsSL https://moonrepo.dev/install/moon.sh | bash

echo 'export PATH="$HOME/.moon/bin:$PATH"' >> "$HOME/.bashrc"
