#!/bin/sh

set -ex

PHPACTOR_INSTALL_DIR="/opt/phpactor"

git clone -b "${VERSION}" -- https://github.com/phpactor/phpactor "${PHPACTOR_INSTALL_DIR}"

cd "${PHPACTOR_INSTALL_DIR}"

composer install --no-dev
chmod -R 755 vendor
