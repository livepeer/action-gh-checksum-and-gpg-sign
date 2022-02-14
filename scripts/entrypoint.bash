#!/bin/bash

set -e

get_artifacts_path() {
  echo -n "${GITHUB_WORKSPACE}/${ARTIFACTS_DIR}/"
}

get_gpg_signing_key() {
  echo -n "${CI_GPG_SIGNING_KEY}"
}

get_gpg_signing_key_passphrase() {
  echo -n "${CI_GPG_SIGNING_KEY_PASSPHRASE}"
}

generate_checksum() {
  cd "$(get_artifacts_path)"
  sha256sum * >"${RELEASE_NAME}_checksums.txt"
}

generate_gpg_signatures() {
  local gpg_key="$(get_gpg_signing_key)"
  local gpg_key_passphrase="$(get_gpg_signing_key_passphrase)"
  if [[ -z "$gpg_key" ]]; then
    return 0
  fi
  # Need to import as --batch because: https://dev.gnupg.org/T2313
  echo "$gpg_key" | gpg --batch --import
  echo "Signature imported!"

  cd "$(get_artifacts_path)"

  for file in $(ls ./ -I '*.txt'); do
    gpg \
      --no-tty \
      --passphrase "$gpg_key_passphrase" \
      --pinentry-mode loopback \
      --output "${file}.sig" \
      --detach-sign \
      "$file"
  done
}

generate_checksum

if command -v gpg; then
  generate_gpg_signatures
fi
