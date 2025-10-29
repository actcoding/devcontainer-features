#!/bin/sh

set -ex

get_architecture()
{
    local uname_m="$(uname -m)"

    case "${uname_m}" in
        x86_64)
            echo "amd64"
            ;;
        arm64|aarch64)
            echo "arm64"
            ;;
        arm)
            echo "armhf"
            ;;
        *)
            echo >&2 "unsupported architecture: ${uname_m}"
            exit 1
    esac
}

FRANKENPHP_VERSION="${VERSION:-1.9.1}"
FRANKENPHP_ARCH="$(get_architecture)"
FRANKENPHP_DOWNLOAD_URL="https://github.com/php/frankenphp/releases/download/v${FRANKENPHP_VERSION}/frankenphp_${FRANKENPHP_VERSION}-1_${FRANKENPHP_ARCH}.deb"

FRANKENPHP_PACKAGE_FILE="/tmp/frankenphp.deb"

curl -fsSL "${FRANKENPHP_DOWNLOAD_URL}" -o "${FRANKENPHP_PACKAGE_FILE}"
sudo dpkg -i "${FRANKENPHP_PACKAGE_FILE}"
rm "${FRANKENPHP_PACKAGE_FILE}"
