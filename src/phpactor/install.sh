#!/bin/sh

set -ex

PHPACTOR_INSTALL_DIR="/opt/phpactor"

if [ ! -d "${PHPACTOR_INSTALL_DIR}" ]; then
    git clone -b "${VERSION}" -- https://github.com/phpactor/phpactor "${PHPACTOR_INSTALL_DIR}"
fi

cd "${PHPACTOR_INSTALL_DIR}"

composer install --no-dev
chmod -R 755 vendor
