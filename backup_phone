#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PING="`which ping` -q -c1 -W 10"

NAS=aurora.home
PHONE=phone.home

down() {
   ${PING} $1 > /dev/null
	[ $? -ne 0 ]
}

if down $NAS; then
    echo "NAS not available at $NAS"
    exit 1
fi

if down $PHONE; then
    echo "Phone not available at $PHONE"
    exit 1
fi

ssh -t $NAS "/bin/rsync --update --progress -azv $PHONE:/sdcard/ /volume1/Backups/Phone"
