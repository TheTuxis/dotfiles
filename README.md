# dotfiles

This repository contains personal configuration files for various development and terminal tools. It is intended to be managed with [GNU Stow](https://www.gnu.org/software/stow/) so all files remain under version control.

## Structure

Each directory holds the configuration for a specific application. Examples include:

- `bash/` and `zsh/` – shell scripts and settings.
- `git/` – global Git configuration.
- `nvim/` – different Neovim setups organised by language or purpose.
- `tmux/` and `wezterm/` – settings for multiplexers and terminal emulators.
- `alacritty/` and `mc/` – additional terminal and file utility configurations.

## Quick install

1. Clone this repository into your workspace:
   ```bash
   git clone https://github.com/usuario/dotfiles.git
   cd dotfiles
   ```
2. Run the `bootstrap.sh` script to link all configurations using `stow`:
   ```bash
   ./bootstrap.sh
   ```
3. If you only need certain modules, edit the script or run `stow` manually.

### Additional packages

The `install_brew_packages.sh` script installs common tools with Homebrew. Run it to install useful dependencies such as Neovim, fzf and lazygit.

```bash
./install_brew_packages.sh
```

## Multiple Neovim configurations

Inside `nvim/.config/` you'll find various setups for different environments (general, Go, Python, Rust, etc.). Launch one by exporting the `NVIM_APPNAME` variable before starting Neovim:

```bash
NVIM_APPNAME=GolangNvim nvim
```

The `zsh/setup-zsh.sh` script also defines an `nvims` function that lets you select the desired configuration interactively via `fzf`.

## License

This project is released under the MIT license. See [LICENSE](LICENSE) for more information.
