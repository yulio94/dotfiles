if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Aliases

# LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Tmux
alias t='tmux'

# Short directories
alias linets="cd /home/yulio94/projects/linets/"
alias rankmi="cd /home/yulio94/projects/rankmi/"
alias personal="cd /home/yulio94/projects/personal/"
alias courses="cd /home/yulio94/projects/courses/"
alias uyaalak="cd /home/yulio94/projects/uyaalak/"
alias newai="cd /home/yulio94/projects/newai/"
alias matrix="/home/yulio94/rankmi/matrix/matrix"

# Lazydocker
alias lazydocker="TERM=screen-256color lazydocker"

# Path to your oh-my-zsh installation.
export ZSH="/home/yulio94/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git
	 git-prompt
	 gitignore
	 alias-finder
	 command-not-found
	 compleat
	 docker
	 sudo
	 git
	 zsh-autosuggestions
	 zsh-syntax-highlighting
 )

source $ZSH/oh-my-zsh.sh

# Deno
export DENO_INSTALL="/home/yulio94/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"

# Batigit
export PATH="/usr/local/bin/batigit/:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

#PDM and probably another stuff
export PATH=/home/yulio94/.local/bin:$PATH

# sdkmanager
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions'
export JAVA_HOME='/usr/lib/jvm/java-17-amazon-corretto'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export CHROME_EXECUTABLE='/usr/bin/brave'

# Keychain
eval $(keychain --eval --quiet id_ed25519)


# Matrix
alias matrix="/home/yulio94/rankmi/matrix/matrix"
eval "$(matrix init)"
