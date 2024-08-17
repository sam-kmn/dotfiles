function nvim
    set -x NVIM_MODE 1
    command nvim $argv
    set -e NVIM_MODE
end
