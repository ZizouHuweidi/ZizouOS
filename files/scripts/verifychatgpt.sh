#!/usr/bin/env bash

set -euo pipefail

rpm -q chatgpt
test -x /usr/bin/chatgpt
test -s /usr/share/applications/chatgpt.desktop

# Only check image-owned files: BlueBuild discards build-time /var state.
repo=/etc/yum.repos.d/chatgpt.repo
grep -qx 'gpgcheck=1' "$repo"
grep -qx 'repo_gpgcheck=1' "$repo"
key=$(sed -n 's|^gpgkey=file://||p' "$repo")
[[ "$key" == /etc/pki/rpm-gpg/* ]]
grep -qxF -- '-----BEGIN PGP PUBLIC KEY BLOCK-----' "$key"
