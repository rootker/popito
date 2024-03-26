#!/bin/sh
#
# Sync photos from iPhone to Linux using libimobiledevice + ifuse

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "usage: $0 <dest dir>"
    exit 1
fi

mnt="$(mktemp -d)"
ifuse "${mnt}"
rsync --exclude=".*" --archive --progress --inplace "${mnt}/DCIM/." "$1"
fusermount -u "${mnt}"
rmdir "${mnt}"
