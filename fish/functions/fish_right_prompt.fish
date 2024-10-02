function fish_right_prompt
    set -l cmd_status $status

    if test $cmd_status -ne 0
        set_color red
        echo "Error ✘ "(date "+%T")
    else
        set_color cyan
        echo (fish_git_prompt)
    end

    set_color normal
end
