function pretty_path
    # by default, Fish shell does not print ~ for $HOME
    echo (pwd | sed "s|^$HOME|~|g")
end
