#!/bin/bash

set -e

echo "🚀 Instalando dependencias base..."
sudo pacman -Sy --noconfirm zsh git fzf zsh-autosuggestions zsh-syntax-highlighting zsh-completions

echo "📦 Instalando zinit..."
mkdir -p ~/.zinit
git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin

echo "🎨 Instalando Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zinit/powerlevel10k

echo "🔧 Instalando fzf integración..."
if [ -d ~/.fzf ]; then
  echo "fzf ya instalado."
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-update-rc --key-bindings --completion
fi

echo "🧹 Guardando configuración en ~/.zshrc..."
cat << 'EOF' > ~/.zshrc
# ZSH CONFIG - ARCH CUSTOM

[[ $- != *i* ]] && return

source ~/.zinit/bin/zinit.zsh
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

[[ -f ~/.p10k.zsh ]] || PS1='[%n@%m %1~]$ '

alias ls='ls --color=auto'
alias kubectl="kubecolor"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-ide="NVIM_APPNAME=IDENvim nvim"
alias rust-nvim="NVIM_APPNAME=rust-nvim nvim"
alias general-nvim="NVIM_APPNAME=general-nvim nvim"
alias python-nvim="NVIM_APPNAME=python-nvim nvim"
alias golang-nvim="NVIM_APPNAME=golang-nvim nvim"

nvims() {
  items=("default" "general-nvim" "golang-nvim" "python-nvim" "rust-nvim" "IDENvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config 🖥️ " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim "$@"
}
bindkey -s '^B' 'nvims\n'

cat_csv() {
  cat "$1" | sed 's/,,/, ,/g' | column -t -s, | less -FXS
}

export GOPATH="$HOME/go"
export GOROOT="/usr/lib/go"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/Dev/Project/github.com/TheTuxis/Erebor/EreborCli/target/release"
export PATH="$HOME/.local/bin:$PATH"

[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

clear

setopt autocd
setopt correct
setopt extended_glob
setopt hist_ignore_dups
setopt share_history
setopt no_beep
EOF

echo "✅ Todo listo. Cambiando shell por defecto a Zsh..."
chsh -s "$(which zsh)"

echo "🎉 Reiniciá tu terminal o ejecutá 'zsh' para empezar."

