#!/usr/bin/env bash
set -e

HOOK_PATH=".git/hooks/post-update"

echo "[setup] re-initializing git with correct config..."

rm -rf .git
git init
git config receive.denyCurrentBranch updateInstead

echo "[setup] installing git hook..."

cp post-update "$HOOK_PATH"
chmod +x "$HOOK_PATH"

echo "[setup] done! [Optional: clean repo with clean.sh]"
