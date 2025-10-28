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

DELTA_VERSION="${VERSION:-0.18.2}"
DELTA_ARCH="$(get_architecture)"
DELTA_DOWNLOAD_URL="https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_${DELTA_ARCH}.deb"

DELTA_PACKAGE_FILE="git-delta.deb"

curl -fsSL "${DELTA_DOWNLOAD_URL}" -o "${DELTA_PACKAGE_FILE}"
sudo dpkg -i "${DELTA_PACKAGE_FILE}"
rm "${DELTA_PACKAGE_FILE}"
