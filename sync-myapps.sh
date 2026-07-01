#!/usr/bin/env bash
#
# sync-myapps.sh — sync custom 1Panel apps from this repo into the panel's
# local-app directory, so they appear under the App Store "Local" category.
#
# Why: community-edition 1Panel cannot point at a custom app-store URL, so we
# keep app templates here (version-controlled) under my-apps/ and copy them
# into the local app dir, then trigger "Sync Local Apps" in the panel.
#
# Usage:
#   ./sync-myapps.sh              # git pull, then sync my-apps/* -> local dir
#   ./sync-myapps.sh --no-pull    # skip git pull, just sync
#   LOCAL_DIR=/custom/path ./sync-myapps.sh   # override target dir
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$REPO_DIR/my-apps"
LOCAL_DIR="${LOCAL_DIR:-/opt/1panel/resource/apps/local}"

PULL=1
[ "${1:-}" = "--no-pull" ] && PULL=0

if [ "$PULL" = "1" ] && [ -d "$REPO_DIR/.git" ]; then
  echo "==> git pull"
  git -C "$REPO_DIR" pull --ff-only
fi

if [ ! -d "$SRC_DIR" ]; then
  echo "no my-apps/ directory — nothing to sync"; exit 0
fi

# Use sudo only if the target dir is not writable (e.g. root-owned /opt/1panel).
SUDO=""
if [ ! -d "$LOCAL_DIR" ]; then
  mkdir -p "$LOCAL_DIR" 2>/dev/null || { command -v sudo >/dev/null 2>&1 && sudo mkdir -p "$LOCAL_DIR"; }
fi
if [ ! -w "$LOCAL_DIR" ]; then
  command -v sudo >/dev/null 2>&1 && SUDO="sudo"
fi

shopt -s nullglob
count=0
for app in "$SRC_DIR"/*/; do
  name="$(basename "$app")"
  echo "==> sync ${name} -> ${LOCAL_DIR}/${name}"
  $SUDO rsync -a --delete "$app" "${LOCAL_DIR}/${name}/"
  count=$((count + 1))
done

if [ "$count" -eq 0 ]; then
  echo "my-apps/ is empty — add your app folders there first."
else
  echo "synced ${count} app(s)."
fi
echo "Next: in 1Panel go to App Store -> Sync Local Apps (or wait for the daily sync)."
