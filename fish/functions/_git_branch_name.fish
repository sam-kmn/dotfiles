function _git_branch_name
    # minus symbol if there are no changes detected to tracked files
    # /dev/null prevents nonsensical errors when you are on directories not tracked by git.
    if test (git status --untracked-files=no --porcelain 2> /dev/null | wc -l) -eq 0
        set indicator "○"
    else
        set indicator "●"
    end

    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if test "$branch_name" != ""
        echo "  $branch_name"
    else
        echo ""
    end
end
