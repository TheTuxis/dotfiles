[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## The following line is added by pre-commit
export PATH="/Users/pdalmasso/Library/Python/3.8/bin:$PATH"
export RANGER_FURY_LOCATION=/Users/pdalmasso/.fury #Added by Fury CLI
export RANGER_FURY_VENV_LOCATION=/Users/pdalmasso/.fury/fury_venv #Added by Fury CLI

# Added by Fury CLI installation process
declare FURY_BIN_LOCATION="/Users/pdalmasso/.fury/fury_venv/bin" # Added by Fury CLI installation process
export PATH="$PATH:$FURY_BIN_LOCATION" # Added by Fury CLI installation process
# Added by Fury CLI installation process
export PATH="$HOME/.fury/fury_venv/bin:$PATH"


# NeoVim
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-ide="NVIM_APPNAME=IDENvim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

nvims(){
  items=("default" "kickstart" "IDENVim" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
  echo "hola"
  echo $NVIM_APPNAME
}

bind -x '"\C-b": nvims'
