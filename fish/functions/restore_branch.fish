function archive_branch
    git checkout -b $argv[1] archive/$argv[1]
end
