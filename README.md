# Introduction

GitHub action to generate sha256 checksums and GPG signatures for
release artifacts.

## Usage

In a GitHub workflow, add the following job step:

```yaml
- name: Generate sha256 checksum and gpg signatures for release artifacts
  uses: livepeer/action-gh-checksum-and-gpg-sign@latest
  with:
    artifacts-dir: releases
    release-name: v1
    gpg-key: ${{ secrets.CI_GPG_SIGNING_KEY }}
    gpg-key-passphrase: ${{ secrets.CI_GPG_SIGNING_KEY_PASSPHRASE }}
```

## Inputs

A short info about accepted inputs for the action are below.

### artifacts-dir

A relative path inside the repo where generated release artifacts get
stored. All files inside this path are considered when generating
checksum and gpg signatures.

**Default**: The default value is `releases`

### release-name

Either a tag value or leave blank. The value is used for the checksum
filename prefix. The checksum file created has the suffix
`_checksums.txt`.

**Default**: Default value is `latest`

### gpg-key & gpg-key-passphrase

Complete GPG signing key to be used. If not provided, the signature
generation step is ignored. The `gpg-key-passphrase` is used if the
signature requires a passphrase to unlock.

**Default**: '' (blank string)
