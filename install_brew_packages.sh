#!/bin/sh

echo "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo "neovim"
brew install --HEAD neovim
brew install ctags
brew install tree-sitter


echo "file utils"
brew install ranger
brew install stow
# brew install unrar # package not available?
# brew install vifm
brew install bat
brew install glow
# brew install marksman # missing formula?


echo "git utils"
# brew install tig
brew install lazygit


echo "greppers"
brew install the_silver_searcher
brew install ripgrep
brew install fzf

echo "graphics"
brew install graphviz
brew install plantuml
brew install mermaid-cli

echo "fonts"
brew tap homebrew/cask-fonts
# brew install font-symbols-only-nerd-font
brew install font-fira-code
brew install font-jetbrains-mono
brew install font-Fira-Code-nerd-font
brew install sfmono-nerd-font

echo "terminals"
brew install kitty
brew install alacritty
brew install tmux

echo "development"
brew install go
brew install pyenv
brew install fnm
brew install jq
brew install httpie

