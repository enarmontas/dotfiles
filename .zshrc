# Path
export PATH=$HOME/.functions:$HOME/bin:$PATH

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
  macos
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

# BEGIN_AWS_SSO_CLI

# AWS SSO requires `bashcompinit` which needs to be enabled once and
# only once in your shell.  Hence we do not include the two lines:
#
# autoload -Uz +X compinit && compinit
# autoload -Uz +X bashcompinit && bashcompinit
#
# If you do not already have these lines, you must COPY the lines
# above, place it OUTSIDE of the BEGIN/END_AWS_SSO_CLI markers
# and of course uncomment it

__aws_sso_profile_complete() {
     local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    _multi_parts : "($(/opt/homebrew/bin/aws-sso ${=_args} list --csv Profile))"
}

aws-sso-profile() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -n "$AWS_PROFILE" ]; then
        echo "Unable to assume a role while AWS_PROFILE is set"
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Usage: aws-sso-profile <profile>"
        return 1
    fi

    eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -p "$1")
    if [ "$AWS_SSO_PROFILE" != "$1" ]; then
        return 1
    fi
}

aws-sso-clear() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -z "$AWS_SSO_PROFILE" ]; then
        echo "AWS_SSO_PROFILE is not set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -c)
}

compdef __aws_sso_profile_complete aws-sso-profile
complete -C /opt/homebrew/bin/aws-sso aws-sso

# END_AWS_SSO_CLI
