alias !!="echo $history[1]"
alias lsa="ls -al"
alias rmr="rm -r"
alias where='which'
alias chmox='chmod +x'
alias wget="curl -O"

alias p="pnpm"
alias pd="pnpm dev"
alias px="pnpm dlx"
alias pnpurge="rm -r node_modules/ && pnpm i --frozen-lockfile"

alias _fzf_gitmoji="gitmoji list | tr '[:upper:]' '[:lower:]' | sed 's/ - :[^:]*: - / /g' | fzf"

alias gc="git commit -m"
alias gcm="git commit -m (_fzf_gitmoji)"
alias gch="git checkout (git branch | fzf)"
alias ga="git add --verbose"
alias gd="git diff"
alias gs="git status --short"
alias gr="git reset --soft HEAD~1"
alias gl="git log --pretty=format:'%Cgreen %ar | %Cred ⌗ %h | %Cblue • %an | %Creset %s' -30 --color | emojify | column -t -s '|'"
alias git-conflicts="git diff --name-only --diff-filter=U"
alias git-check="test -d .git"

alias termbin="nc termbin.com 9999"
alias ai="aichat --role=%shell%"
alias myz='cd ~/code/stonecode/myziegler-portal'
alias config="cd ~/.config"
alias choose-app="open -a (command ls /Applications | sed 's/.app//g' | choose)"
# alias push="git push (git branch --show-current)"
# alias pull="git pull (git branch --show-current)"
# alias gr="git reset --hard && git clean -fd"

# alias nclear="clear && neofetch && ls"
alias passdice="diceware -n="4" -d="-" --no-caps --wordlist="en_adjectives""
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"
alias logoff="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias desktopshow="defaults write com.apple.finder CreateDesktop -bool true && killfinder"
alias desktophide="defaults write com.apple.finder CreateDesktop -bool false && killfinder"
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupad="find . -type d -name '.AppleD*' -ls -exec /bin/rm -r {} \;"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"
#alias net-port-open       "lsof -PiTCP -sTCP:LISTEN"
#alias net=-port-open       "lsof -Pn -i4 | awk 'NR<3 || /ESTABLISHED/ || /LISTEN/'"
