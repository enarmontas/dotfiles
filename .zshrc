# Path
export PATH=$HOME/.functions:$HOME/go/bin:$HOME/bin:$PATH

# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean"

# Hyphen insensitive completion
HYPHEN_INSENSITIVE="true"

# History command output stamp format: mm/dd/yyyy | dd.mm.yyyy | yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
  ansible
  brew
  bundler
  docker
  docker-compose
  gem
  git
  github
  knife
  knife_ssh
  nmap
  node
  osx
  pip
  pyenv
  python
  rails
  rake
  rbenv
  ruby
  vagrant
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set projects directory
export PROJECTS=~/code

# Set editor
export EDITOR='vim'

# Set prompt: "directory/ (master✗) $"
PROMPT='%{$fg_bold[green]%}➜%{$fg_bold[green]%}%p %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}'

# Set language environment
export LANG=en_US.UTF-8

# Set Homebrew to auto update once a week
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Include local profile
if [ -f ~/.localrc ]
then
  source ~/.localrc
fi

# Include aliases
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# Include functions
if [ -f ~/.functions ]
then
  source ~/.functions
fi

# Load completion
autoload -Uz compinit && compinit

# Enable better history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
