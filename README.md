# dotfiles

Shared Bash settings for a WSL host and for VS Code Dev Containers. `install.sh` is written to be run automatically by Dev Containers in every new container.

## Contents

| File | Purpose |
| --- | --- |
| `.bash_aliases` | Aliases and history settings |
| `.inputrc` | Readline settings |
| `install.sh` | Links the two files into `$HOME` and updates `~/.bashrc` |

### `.bash_aliases`

Aliases:

| Alias | Command |
| --- | --- |
| `ll` | `ls -alFh --group-directories-first` |
| `..` | `cd ..` |
| `g` | `git` |
| `gs` | `git status -sb` |
| `gl` | `git log --oneline --graph --decorate -20` |
| `gd` | `git diff` |
| `gco` | `git switch` |
| `gcb` | `git switch -c` |
| `dc` | `docker compose` |
| `k` | `kubectl` |
| `bat` | `batcat`, only if `batcat` is installed |
| `fd` | `fdfind`, only if `fdfind` is installed |

History settings: `HISTSIZE=50000`, `HISTFILESIZE=100000`, `HISTCONTROL=ignoreboth:erasedups` and `histappend`.

### `.inputrc`

Includes `/etc/inputrc`, then turns on case-insensitive completion, lists all matches on the first Tab press, colours completion listings by file type and binds the Up and Down arrows to prefix search through history.

## Installation

### Dev Containers

Set the VS Code setting `dotfiles.repository` to this repository. Dev Containers clones it into each container and runs `install.sh`.

### Manual (for example on the WSL host)

```bash
git clone <this repo> ~/dotfiles
bash ~/dotfiles/install.sh
```

`install.sh` does the following:

1. Creates symlinks `~/.bash_aliases` and `~/.inputrc` pointing at the files in the repo, replacing any existing files of those names.
2. Appends a line to `~/.bashrc` that sources `~/.bash_aliases`, unless `.bashrc` already mentions it.
3. If `/commandhistory` exists, appends lines to `~/.bashrc` that write history to `/commandhistory/.bash_history` after each command, so history survives container rebuilds. The directory is expected to be mounted by the devcontainer configuration.

Running the script again does not duplicate the `.bashrc` lines.
