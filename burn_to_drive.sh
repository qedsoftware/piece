#!/usr/bin/env bash
set -e

# Sanity checks
which sudo > /dev/null
which dd > /dev/null
which parted > /dev/null
which e2fsck > /dev/null
which resize2fs > /dev/null

DRIVE_PATH=$1

# Print usage if DRIVE_PATH is not provided
if [ -z "${DRIVE_PATH}" ]; then
    echo "USAGE: $0 DRIVE_PATH"
    echo ""
    echo "  Example: $0 /dev/sdb"
    exit 1
fi

if [[ "${DRIVE_PATH}" =~ "sda" ]]; then
    echo "I refuse to nuke the main filesystem!"
    exit 1
fi

echo "Contents of the drive at ${DRIVE_PATH} will be nuked"
read -p "Are you sure? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
sudo bash <<EOF
echo "Writing disk image"
dd if=./piece.img of=${DRIVE_PATH} status=progress conv=fsync
parted ${DRIVE_PATH} name 1 PIECE
echo "Resizing partition"
parted ${DRIVE_PATH} resizepart 1 100%
echo "Checking the filesystem"
e2fsck -fp ${DRIVE_PATH}1
echo "Resizing the filesystem"
resize2fs ${DRIVE_PATH}1
echo "Checking the filesystem again"
e2fsck -fp ${DRIVE_PATH}1
echo "Done"
EOF
fi