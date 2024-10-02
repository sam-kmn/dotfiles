function ls --wraps='eza -l --git --icons --group-directories-first --time-style relative --no-user --no-permissions --no-filesize'
    eza -l --git --icons --group-directories-first --time-style relative --no-user --no-permissions --no-filesize $argv
end
