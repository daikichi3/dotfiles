# プロンプト
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '

alias ls='/usr/local/bin/gls --color=auto'
eval $(/usr/local/bin/gdircolors ~/bash_dir/dircolors-solarized-master/dircolors.ansi-universal)

set -o vi
alias ll='ls -al'

# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# 補完
autoload -U compinit
compinit

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/shims:$PATH"

eval "$(rbenv init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$HOME/local/bin:$PATH"
