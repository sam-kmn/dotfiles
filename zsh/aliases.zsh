# SYS
alias cd="zldir"
alias dir="mkdir"

alias l="exa --tree --icons --level="1" --sort="type""
alias al="exa -al"
# alias ls="exa --tree --icons --level="2" --sort="type""

alias cat="bat -p --paging=never --wrap=never"
alias grep='grep --color=auto'

alias reload="source ~/.zshrc && clear"
alias clear='clear && neofetch'

# NPM
alias p="pnpm"
alias pd="pnpm dev"

# BREW
alias b="brew"
alias bs="brew search"
alias bi="brew install"
alias bu="brew update && brew upgrade"

# PATHS
alias dot="~/code/dotfiles"

#CUSTOM
alias ai="aichat --role=%shell%"

# GIT
alias g="git"
alias gl='git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %<(50,trunc)%Creset%s" --date=relative --color | emojify | head'
alias gd="git diff"
alias gb="git branch"
alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gh="git checkout"


# FILE SHARING
alias clbin='~/.config/zsh/plugins/clbin.sh'
alias termbin='nc termbin.com 9999'
# alias transfer="bash <(curl -L -s https://alicia.url.lol/transfer)"


# CRYPTO
alias crypto='curl rate.sx'

# alias myz_start="screen -dmS myz_frontend pnpm dev && echo \"\n MYZ-Frontend status: 🟢 \""
# alias myz_stop="screen -X -S myz_frontend quit && echo \"\n MYZ-Frontend status: 🔴 \""
# alias g='rg -l --hidden --smart-case --line-buffered'
# alias brew_cask_upgrade="brew upgrade $(brew  outdated --cask --greedy --quiet)"
# brew upgrade --cask $(brew list --cask)
# alias gl='git log --pretty=format:"%C(yellow)%h %Cgreen%<(7)%aN%Cred%d %n %Cblue%>(12)%ad %<(50,trunc)  %Creset%s %n" --date=relative --color | emojify | head'
