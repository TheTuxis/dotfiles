export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Users/pdalmasso/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Added by furycli:
#export PATH="/Users/pdalmasso/Library/Python/3.8/bin:$PATH"
# Custom promnt
export PS1="[\u@\h \W]$ "
# end custom promnt

# Added git complete:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# end git complete
#alias ls='ls -G'
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

# Brew settings

eval "$(/opt/homebrew/bin/brew shellenv)"

# Go Config

export GOPATH="${HOME}/go"
#GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
#export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
export GOMELI="${HOME}/go/src/github.com/mercadolibre"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com/mercadolibre" || mkdir -p "${GOPATH}/src/github.com/mercadolibre"

# Tools

cat_csv()
{
  cat $1 | sed 's/,,/, ,/g' | column -t -s, | less -FXS
}

# Added by furycli:
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

export PATH="/Users/pdalmasso/.local/bin:$PATH"
alias python="python3"
alias pip="pip3"
alias fda_get_token="export FURY_TOKEN=\$(fury get-token | tail -1)"
tmux

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#Added by furycli:
export PATH=/Users/pdalmasso/Library/Python/3.9/bin:/Users/pdalmasso/.sdkman/candidates/java/current/bin:/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/pdalmasso/Library/Python/3.9/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/pdalmasso/go/bin:/bin:/Users/pdalmasso/.fzf/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pdalmasso/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/pdalmasso/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pdalmasso/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/pdalmasso/Downloads/google-cloud-sdk/completion.bash.inc'; fi

source .bashrc
