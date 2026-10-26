#!/bin/sh
# mkcard.sh IMG FILE... -- an MBR-partitioned FAT32 card image holding FILE... unchanged in its root
# directory (the Z1013's .COM files already carry their 9-byte @DD head).  No root, no loop device: sfdisk writes the
# partition table into the file, mkfs.fat and mtools address the partition by its byte offset.
# SIZE_MB (default 64) sets the image size; FAT32 needs >= 65525 clusters, so the cluster is one sector.
set -e
[ $# -ge 1 ] || { echo "usage: $0 IMG [FILE...]" >&2; exit 2; }
img=$1; shift
size=${SIZE_MB:-64}
start=2048                                           # the partition's first sector (1 MiB, as card formatters do)
rm -f "$img"
truncate -s ${size}M "$img"
echo "start=$start, type=c" | sfdisk -q "$img"
sectors=$(( size * 2048 - start ))
mkfs.fat -F 32 -s 1 -n Z1013 --offset $start "$img" $(( sectors / 2 )) >/dev/null
off=$(( start * 512 ))
for f in "$@"; do
    MTOOLS_SKIP_CHECK=1 mcopy -i "$img@@$off" "$f" "::$(basename "$f" | tr a-z A-Z)"
done
