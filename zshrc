# Set vi-mode
bindkey -v

# Set prompt substitution for wunjo
setopt PROMPT_SUBST

# Set up prompt
autoload -U promptinit
promptinit
prompt wunjo # Custom prompt that shows vcs info


# Set history settings
setopt INC_APPEND_HISTORY SHARE_HISTORY # Increment history and share
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt EXTENDED_HISTORY
HISTFILE=$HOME/.zhistory
HISTSIZE=10200 # Histsize > savehist to give some breating room
SAVEHIST=10000

# Exports settings
HOSTNAME="`domainname`" # iptools deprecated
PAGER='less'
EDITOR='vim'
export HOSTNAME PAGER EDITOR

# Source subfiles
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases ]
fi
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases ]
fi
if [ -f ~/.bash_exports ]; then
    source ~/.bash_exports ]
fi
if [ -f ~/.zsh_exports ]; then
    source ~/.zsh_exports ]
fi
if [ -f ~/bin/sandbox ]; then
    source ~/bin/sandbox >> /dev/null
fi
if [ -f ~/.zsh/completion ]; then
    source ~/.zsh/completion
fi
if [ -f ~/.todo_completion ]; then
    source ~/.todo_completion
fi


autoload -U edit-command-line
zle -N edit-command-line

bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^[[B' history-search-forward
bindkey '^[[A' history-search-backward
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^E' complete-word # complete on tab, leave expansion to _expand
bindkey -M vicmd v edit-command-line


# Start gpg agent
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export GPG_TTY=$(tty)
fi

# Start reminder
rempath=$(which rem)
if [ -e $rempath ]; then
    rem
fi

#export SANE_DEFAULT_DEVICE="plustek:libusb:002:007"
