#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

export LD_LIBRARY_PATH="$DIR/lib:$DIR:$LD_LIBRARY_PATH"
export mesa_glthread=true
export HALO_FULLSCREEN=true

exec ./halo "$@"
