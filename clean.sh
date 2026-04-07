#! /usr/bin/bash
set -e

echo "[clean] removing bootstrap files..."

rm -f post-update setup.sh clean.sh

echo "[clean] renaming README.md to repo_setup_doc.md..."

mv README.md repo_setup_doc.md

echo "[clean] done"
