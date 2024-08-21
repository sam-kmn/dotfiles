function ls --wraps='lsd --gitsort' --wraps='eza -l --no-permissions --no-filesize --time-style relative --no-user --git --icons --almost-all --group-directories-first' --description 'alias ls=eza -l --no-permissions --no-filesize --time-style relative --no-user --git --icons --almost-all --group-directories-first'
  eza -l --no-permissions --no-filesize --time-style relative --no-user --git --icons --almost-all --group-directories-first $argv
        
end
