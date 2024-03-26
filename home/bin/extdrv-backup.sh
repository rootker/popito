#!/bin/bash
set -euo pipefail

EXTDRV_FILE='/dev/disk/by-uuid/026f70c9-3074-4aba-aba4-c3ef4ce6a474'
EXTDRV_LABEL='extdrv'
EXTDRV_MOUNT='/mnt/extdrv'

SRC_ROOT='/home/foobar'
DEST_ROOT='/mnt/extdrv/foobar'

mount() {
    sudo mkdir -p "${EXTDRV_MOUNT}"
    sudo cryptsetup open "${EXTDRV_FILE}" "${EXTDRV_LABEL}"
    sudo mount "/dev/mapper/${EXTDRV_LABEL}" "${EXTDRV_MOUNT}"
}

unmount() {
    sudo umount "${EXTDRV_MOUNT}"
    sudo cryptsetup close "${EXTDRV_LABEL}"
    sudo rmdir "${EXTDRV_MOUNT}"
}

backup() {
    rsync \
        --exclude "/.cache" \
        --exclude "/.go" \
        --exclude "/.cargo" \
        --exclude "/.rustup" \
        --exclude "/.java" \
        --exclude "/.android" \
        --exclude "/.gradle" \
        --exclude "/.local/share/Trash" \
        --exclude "/Downloads" \
        --archive \
        --progress \
        --inplace \
        --delete \
        "${SRC_ROOT}/." \
        "${DEST_ROOT}"
}

all() {
    mount
    backup
    unmount
}

"$@"