#--------------------------------------------------------------------------------#
#                                                                                #
#  _____                ______               __                           __     #
# |     |_.--.--.----. |   __ \.-----.-----.|  |--.----.-----.--.--.----.|  |--. #
# |       |  |  |  __| |      <|  _  |  _  ||  _  |   _|  _  |  |  |  __||    <  #
# |_______|_____|____| |___|__||_____|_____||_____|__| |_____|_____|____||__|__| #
#                                                                                #
#                                                                                #
# +-----------------------------------------------------+                        #
# |     _____        __                                 |                        #
# |    /__  /  _____/ /_  __________                    |                        #
# |      / /  / ___/ __ \/ ___/ ___/                    |                        #
# |   _ / /__(__  ) / / / /  / /__                      |                        #
# |  (_)____/____/_/ /_/_/   \___/                      |                        #
# |                                                     |                        #
# +-----------------------------------------------------+                        #
#                                                                                #
#--------------------------------------------------------------------------------#
#
# 〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰
# ⌇                                                                            ⌇
# 〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰
#
# +----------+
# | Preamble |
# +----------+

# Helper function to source files on different systems
function zsource() {
    for direc in "/usr/share" "/opt/local/share" "/usr/share/zsh/plugins"
    do
        if [ -f "$direc/$1" ]; then
            source "$direc/$1"
            return
        fi
    done
    echo "Could not source $1"
}

function zsource_ifexists() {
    if [ -f "$1" ]; then
        source "$1"
        return
    fi
    echo "Could not source $1"
}

if [ -f "/usr/share/zsh/site-functions" ]; then
    fpath=(/usr/share/zsh/site-functions $fpath)
fi

# Set window title to current directory
# Executed just after a command has been read and is about to be executed.
function precmd () {
  window_title="\033]0;$0 ~ ${PWD}\007"
  echo -ne "$window_title"
}

# +------+
# | Path |
# +------+

# Add .cargo/bin if not already in the path
case :$PATH: in
  *:$HOME/.cargo/bin:*)
      # echo "cargo bin already in path"
      ;;  # do nothing
  *) 
      # echo "cargo bin is not in the path" 
      export PATH="$HOME/.cargo/bin:$PATH"
      ;;
esac

case :$PATH: in
  *:$HOME/.emacs.d/bin:*)
      # echo "cargo bin already in path"
      ;;  # do nothing
  *) 
      # echo "cargo bin is not in the path" 
      export PATH="$HOME/.emacs.d/bin:$PATH"
      ;;
esac

case :$PATH: in
  *:$HOME/.local/bin:*)
      # echo "cargo bin already in path"
      ;;  # do nothing
  *) 
      # echo "cargo bin is not in the path" 
      export PATH="$HOME/.local/bin:$PATH"
      ;;
esac


# Add macports path to the front
if [[ `uname` == "Darwin" ]]; then
      export PATH="/opt/local/bin:$PATH"
fi

# +---------------+
# | Shell options |
# +---------------+

# Changing Directories
setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Input/Output
setopt NOCORRECT            # Spelling correction
setopt NOCLOBBER            # don overwrite > file, if the file exists, use >| to force overwrite.
setopt APPEND_CREATE        # >> file will create it if it doesn't exist

# Expansion and Globbing
setopt EXTENDED_GLOB        # Use extended globbing syntax.

unsetopt COMPLETEALIASES    # https://unix.stackexchange.com/questions/335145/using-zsh-autocompletion-for-alias

# +---------+
# | History |
# +---------+

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
setopt APPEND_HISTORY       # Append to history file rather than replace 
setopt INC_APPEND_HISTORY   # Write to the history file periodically, rather than when exiting.
setopt HIST_IGNORE_DUPS     # Do not enter command lines into the history list if they are duplicates
                            # of the previous event.
setopt HIST_ALLOW_CLOBBER   # add | to history entries of > file.

# +-------------+
# | Bloody beep |
# +-------------+

unsetopt BEEP
unsetopt HIST_BEEP

# +-------------+
# | Completions |
# +-------------+

# tab-complete hidden files
_comp_options+=(globdots) # With hidden files.
# zstyle :compinstall filename '/home/lro/.zshrc'
autoload -Uz compinit; compinit

# Completions are stored in a separate file
ZSH_COMPLETIONS="$ZDOTDIR/.zshcompletions"
source $ZSH_COMPLETIONS

EDITOR=nvim

# +---------+
# | Aliases |
# +---------+

alias l="ls -F --color=auto"
alias ll="ls -l -F --color=auto"
alias la="ls -la -F --color=auto"
if command -v exa > /dev/null; then
    alias ls="exa"
    alias l="exa"
    alias ll="exa -l"
    alias la="exa -la"
fi
alias cd..="cd .."
alias config="git --git-dir=$HOME/.config/.git --work-tree=$HOME/.config"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gcma="git commit -a -m"
alias d='dirs -v' # show the directory stack
alias df="df -h"
alias ta="tmux attach"
alias jo="joshuto"
alias lg="lazygit"
if [ ! $(command -v hx) ]; then
  alias hx="helix"
fi
alias lgconfig="lg --git-dir=$HOME/.cfg --work-tree=$HOME"
alias lgy="lg --git-dir=$HOME/.local/share/yadm/repo.git/ --work-tree=$HOME"

# alternative vim configs
alias nvimc="XDG_CONFIG_HOME=~/nvim-config XDG_DATA_HOME=~/nvim-config/share nvim"
alias nvchad="XDG_CONFIG_HOME=~/nvchad XDG_DATA_HOME=~/nvchad/share nvim"
alias nvlazy="XDG_CONFIG_HOME=~/nvlazy XDG_DATA_HOME=~/nvlazy/share nvim"
# alias nvim="XDG_CONFIG_HOME=~/nvchad XDG_DATA_HOME=~/nvchad/share nvim"

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'

for index ({1..9}) alias "d$index"="cd +${index}"; unset index

# +--------------+
# | key bindings |
# +--------------+

bindkey -e
# bindkey -v

# zsource_ifexists /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

export ZVM_NORMAL_MODE_CURSOR=bbl
export COLORTERM=truecolor

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\eOc"  emacs-forward-word
bindkey "\eOd"  emacs-backward-word
bindkey "^H"    backward-delete-word

if [[ `uname` == "Darwin" ]]; then
    bindkey "ƒ"     forward-word
    bindkey "∫"     backward-word
else
    bindkey "\e[1;5C" forward-word
    bindkey "\e[1;3C" forward-word
    bindkey "\e[5C"   forward-word
    bindkey "\e[1;5D" backward-word
    bindkey "\e[1;3D" backward-word
    bindkey "\e[5D"   backward-word
fi

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH"  beginning-of-line
bindkey "\eOF"  end-of-line

# for freebsd console
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line

# completion in the middle of a line
bindkey '^i'    expand-or-complete-prefix

#      ___                ___            __  _                 
#     /   |  ____  ____  / (_)________ _/ /_(_)___  ____  _____
#    / /| | / __ \/ __ \/ / / ___/ __ `/ __/ / __ \/ __ \/ ___/
#   / ___ |/ /_/ / /_/ / / / /__/ /_/ / /_/ / /_/ / / / (__  ) 
#  /_/  |_/ .___/ .___/_/_/\___/\__,_/\__/_/\____/_/ /_/____/  
#        /_/   /_/                                             

# Starship prompt
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
else
    echo "Starship not installed."
fi

# +-------+
# | Broot |
# +-------+
if [ -f "$HOME/.config/broot/launcher/bash/br" ]; then
    source "$HOME/.config/broot/launcher/bash/br"
else
    echo "Couldn't source broot."
fi

# +-----+
# | Bat |
# +-----+
if command -v bat > /dev/null; then
    export BAT_THEME="gruvbox-dark"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# +-----------------+
# | FZF completions |
# +-----------------+

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/key-bindings.zsh

ZSH_FZF="$ZDOTDIR/fzf.zsh"
source $ZSH_FZF

# Quick edit
vzv() {
    fzf -1 -m --preview 'bat --color=always {}' </dev/tty | xargs -r -o $EDITOR;
}

if [ $(command -v "fzf") ]; then
    zsource fzf/completion.zsh
    zsource fzf/key-bindings.zsh

    # zsource_ifexists /usr/share/doc/fzf/examples/completion.zsh
    # zsource_ifexists /usr/share/doc/fzf/examples/key-bindings.zsh

    # Search with fzf and open selected file with Vim
    zle -N vzv vzv
    bindkey '^v' vzv
fi

# +--------+
# | Zoxide |
# +--------+

if command -v zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
else
    echo "Zoxide not installed."
fi

# +------+
# | Less |
# +------+

export LESS="-Q -R -S"
# export LESSOPEN='|bat --color=always --decorations=always %s'
export LESSOPEN="|lesspipe.sh %s"

# +-------------+
# | colorscript |
# +-------------+

if [ $(command -v "colorscript") ]; then
    colorscript random
fi

#      ____  __            _               
#     / __ \/ /_  ______ _(_)___  _____    
#    / /_/ / / / / / __ `/ / __ \/ ___/    
#   / ____/ / /_/ / /_/ / / / / (__  ) _ _ 
#  /_/   /_/\__,_/\__, /_/_/ /_/____(_|_|_)
#                /____/                    

# command not found
# source $ZDOTDIR/command-not-found.plugin.zsh

# +-------------+
# | zsh-vi-mode |
# +-------------+

# The zsh-vi-mode plugin causes my FZF mapping to disappear, 
# because it has a hook that is run after this script, that 
# reinitializes the keymap. => we set it again in the
# zvm_after_init hook.
# check out: https://github.com/jeffreytse/zsh-vi-mode
# zsource_ifexists /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# +-----------------------------+
# | Auto suggestions, à la fish |
# +-----------------------------+

zsource zsh-autosuggestions/zsh-autosuggestions.zsh
zsource zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
