#!/bin/zsh

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ $TERM == "eterm-color" ]]; then
    # FIXES ugly formatting issue when run inside emacs
    export ZSH_THEME=3den
else
    export ZSH_THEME=bureau
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(sudo zsh-dircolors-solarized docker man)
plugins=(sudo docker man)

echo source $ZSH/oh-my-zsh.sh
source $ZSH/oh-my-zsh.sh

autoload -U colors zsh/terminfo
colors
setopt prompt_subst
PR_NO_COLOR="%{$terminfo[sgr0]%}"
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done


# Customize to your needs...
. ~/.zsh/alias
. ~/.zsh/function
. ~/.zsh/conda # conda/mamba/pixi stuff
. ~/.zsh/gerrit
. ~/.zsh/notebook
. ~/.zsh/keybindings
#. ~/.zsh/opts
# . ~/.zsh/theme.zsh-theme
. ~/.zsh/emacs

if [ -d ~/.zsh.d/ -a ! "$(ls -A ~/.zsh.d/ 2> /dev/null)" = "" ]; then
   # see https://superuser.com/questions/397307
   fnames=`find ~/.zsh.d/ -maxdepth 1 -type f  ! -name 'zprofile'`
   for fname in $fnames; do
       # echo $fname
       . $fname
   done
fi

setopt cdablevars # support for $> dotf # changes CWD
setopt interactivecomments # pound sign in interactive prompt
setopt nohup  # don't kill child processes of the current zsh when the zsh
              # process is killed

if [ ! -e ~/.zsh/zsh-dircolors-solarized ]; then
    git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized ~/.zsh/zsh-dircolors-solarized
fi
source ~/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

#eval "$(_DEV_COMPLETE=source_zsh dev)"

#. ~/gitrepos/devenv/activation.sh
#
# Setup fzf
# TODO oneliner
if [ -e $HOME/.fzf ]; then
    fzfdir=$HOME/.fzf
else
    fzfdir=/usr/share/fzf
fi
export FZF_DEFAULT_COMMAND='rg --files --hidden'
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# this is needed s.t. Ctrl-T respects my global gitignore file and doesn't output files in e.g. __pycache__
export FZF_CTRL_T_COMMAND='rg --files --hidden'

# Key bindings
# ------------
source "$fzfdir/shell/key-bindings.zsh"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzfdir/shell/completion.zsh" 2> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv setup
eval "$(direnv hook zsh)"

# enable directory tracking
function vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'

echo "zshrc sourced"

# source ~/.config/broot/launcher/bash/br

# so far only on my dell laptop
GUIX_PROFILE="$HOME/.config/guix/current"
if [ -e $GUIX_PROFILE ]; then
    . "$GUIX_PROFILE/etc/profile"
fi
GUIX_PROFILE="$HOME/.guix-profile"
if [ -e $GUIX_PROFILE ]; then
    . "$GUIX_PROFILE/etc/profile"
fi
