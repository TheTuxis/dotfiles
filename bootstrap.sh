#!/usr/bin/env bash
# Simple bootstrap script for this dotfiles repo
set -e

# Determine repo root directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

install_stow() {
  if command -v brew >/dev/null 2>&1; then
    brew install stow
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y stow
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm stow
  else
    echo "Please install 'stow' manually." >&2
    exit 1
  fi
}

if ! command -v stow >/dev/null 2>&1; then
  echo "Installing GNU Stow..."
  install_stow
fi

# Detect directories with configurations
modules=()
while IFS= read -r -d $'\0' dir; do
  modules+=("$(basename "$dir")")
done < <(find "$REPO_DIR" -mindepth 1 -maxdepth 1 -type d ! -name '.git' -print0)

for module in "${modules[@]}"; do
  echo "Linking $module"
  stow -R "$module"
done

echo "\nDone!"
