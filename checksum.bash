#!/bin/sh

set -e

ARTIFACTS_DIR="$ARTIFACTS_DIR"

cd "$ARTIFACTS_DIR"

sha256sum * >"${RELEASE_NAME}_checksums.txt"
