#!/usr/bin/env bash
# Dotfiles installer run by Dev Containers inside every container.
# Push this folder to github.com/<you>/dotfiles and set "dotfiles.repository" in settings.json.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "$DIR/.bash_aliases" "$HOME/.bash_aliases"
ln -sf "$DIR/.inputrc" "$HOME/.inputrc"

# Source aliases from .bashrc if the image's .bashrc does not already do so.
if ! grep -q '.bash_aliases' "$HOME/.bashrc" 2>/dev/null; then
  echo '[ -f ~/.bash_aliases ] && . ~/.bash_aliases' >> "$HOME/.bashrc"
fi

# Persist shell history across container rebuilds when /commandhistory is mounted
# (see the mounts block in the devcontainer templates).
if [ -d /commandhistory ]; then
  if ! grep -q 'commandhistory' "$HOME/.bashrc"; then
    echo 'export PROMPT_COMMAND="history -a"; export HISTFILE=/commandhistory/.bash_history' >> "$HOME/.bashrc"
  fi
fi
