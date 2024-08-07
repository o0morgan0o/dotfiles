DISABLE_AUTO_UPDATE="true"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/home/morgan/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git z zsh-autosuggestions zsh-syntax-highlighting tmux)
plugins=(
  git # définit tout un tas d'alias pour git
  z # permet de voir les répertoires les plus fréquemment utilisés `z <nom du répertoire>`
  zsh-256color
  kubectl-autocomplete
  symfony-console # for autocompletion symfony
  )

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8
 export LC_TYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# to keep aliases even when we use sudo
alias sudo="sudo"
alias x="xplr"
alias r="yazi"
alias y="yazi"
alias w="watch "
alias vim="nvim"
alias vi="nvim"
alias glab="GITLAB_HOST=gitlab.morgan-thibert.com glab"
alias k="krusader --left ."

ZSH_THEME="agnoster"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt no_share_history
unsetopt share_history
#setopt SHARE_HISTORY
# dont share history between tabs
#unsetopt inc_append_history
#unsetopt share_history
#unsetopt inc_append_history
#unsetopt share_history



# autocomplete
setopt noautomenu
setopt nomenucomplete


# TMUX
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_CONFIG=$HOME/.tmux

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autojump
#source /usr/share/autojump/autojump.zsh
# fzf key mappings
#source /usr/share/doc/fzf/examples/key-bindings.zsh

# cargo
export PATH="${PATH}:/home/morgan/.cargo/bin"
# npm binaries
export PATH="${PATH}:/home/morgan/.npm-global/bin"
# snap packages
export PATH="${PATH}:/snap/bin"
# zsh-themes
#source ~/powerlevel10k/powerlevel10k.zsh-theme
# other paths
export PATH="${PATH}:/home/morgan/.local/bin"
# toolbox jetbrans
export PATH="${PATH}:/home/morgan/.local/share/JetBrains/Toolbox/scripts"
# kubernetes krew
export PATH="${PATH}:/home/morgan/.krew/bin"
# go
export PATH="${PATH}:/usr/local/go/bin"
# osmosis
#export PATH="${PATH}:/home/morgan/code/openstreetmap-tools/osmosis-0.49.2/bin"
# maperitive
#export PATH="${PATH}:/home/morgan/code/openstreet-mapper/maperitive/Maperitive"
# wine
export PATH="${PATH}:/usr/lib/wine/"
# go
export GOPATH=$HOME/go

# try to fix glitches bug with percents
unsetopt PROMPT_SP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source /home/morgan/.p10k.zsh

setxkbmap -layout "us" -variant "qwerty-fr"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export EDITOR=nvim
export VISUAL=nvim
export PATH

# prefered original behavior for history
bindkey "$terminfo[kcuu1]" up-history
bindkey "$terminfo[kcud1]" down-history
# below is behavior for search including start of line
#bindkey '\eOA' history-beginning-search-backward
#bindkey '\e[A' history-beginning-search-backward
#
#


# Load Angular CLI autocompletion.
#source <(ng completion script)

#source /home/morgan/.config/broot/launcher/bash/br
