set -x VISUAL code
set -x EDITOR code
#set -Ux TERM_DEFAULT Therm

set -gx PNPM_HOME /Users/sam/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

fzf --fish | source

# function push
#     git push origin (git branch --show-current)
# end

# function pull
#     git pull origin (git branch --show-current)
# end

# source ~/.config/fish/.iterm2_shell.fish
# string match -q "$TERM_PROGRAM" "vscode"
# and . (code --locate-shell-integration-path fish)
# bind \c\r command edit
# fzf --fish | source
