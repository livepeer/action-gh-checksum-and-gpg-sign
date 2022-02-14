#!/bin/sh

set -e

ARTIFACTS_DIR="$ARTIFACTS_DIR"

cd "$ARTIFACTS_DIR"

# Need to import as --batch because: https://dev.gnupg.org/T2313
echo "$CI_GPG_SIGNING_KEY" | gpg --batch --import
echo "Signature imported!"

for file in $(ls ./ -I '*.txt'); do
  gpg \
    --no-tty \
    --passphrase "$CI_GPG_SIGNING_PASSPHRASE" \
    --pinentry-mode loopback \
    --output "${file}.sig" \
    --detach-sign \
    "$file"
done
