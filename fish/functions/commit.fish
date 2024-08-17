function commit --argument scope --description 'git commit with gitmoji'
    set -l message (_fzf_gitmoji)

    if test $scope
        set -a message "($scope)"
    end

    if contains $PWD /Users/sam/code/stonecode/myziegler-portal
        tsc .
        if test $status -ne 0
            return
        end
    end

    git commit -m "$message"
end
