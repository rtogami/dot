source ~/.zplug/init.zsh
autoload -Uz colors
colors

zplug "wbinglee/zsh-wakatime"


# Syntax
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# Language
export LANG=ja_JP.UTF-8

# Prompt

PROMPT="%{${fg[blue]}%}%c%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' formats "%F{blue}(%f%F{green}%c%u%b%f%F{blue})%f"
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () { vcs_info }
PROMPT=$PROMPT'${vcs_info_msg_0_} '

# Alias
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"
alias g='git'
alias v='nvim'
alias vim='nvim'
alias diff="coloddiff"
alias ag="hw"

# History
zplug "zsh-users/zsh-history-substring-search"
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completions
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
