function archive_branch
    git tag archive/$argv[1] $argv[1]
    git branch -D $argv[1]
end
