# Get a string describing the current HEAD if we are in a git repository
function git_get_branch
    if git rev-parse --git-dir > /dev/null ^&1
        # This is a valid git repository (but maybe not the top level).
        git describe --all ^ /dev/null
    else
        echo ""
    end
end
