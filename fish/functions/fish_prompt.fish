function fish_prompt
    # echo
    # if test -n "$SSH_TTY"
    #     echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    # end
    echo
    echo (set_color red)(pwd)' ❯ '(set_color normal)
end

function fish_preexec --on-event fish_preexec
    echo
end
