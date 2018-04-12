# Setup prompt so that it has the form:
# `HH:MM:SS user@host [current-path]       git-describe`

# Allocate variables
local -h termwidth
local -h right_prompt_length left_prompt_length
local -h time_ branch_ dir_
local -h host user

# Get a string describing the current HEAD if we are in a git repository
function get_git_branch() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # This is a valid git repository (but maybe not the top level).
        git describe --all 2>/dev/null
    else
        echo ""
    fi
}

update_left_prompt() {
    user=`whoami`
    host=`hostname`
    local -h left_prompt_naked
    # Create string to calculate lenght. Time always uses the same space
    left_prompt_naked="00:00:00 $user@$host [$dir_]"
    (( left_prompt_length = $(printf "%s" "$left_prompt_naked" | wc -m) ))
}

update_right_prompt() {
    branch_=`printf "%s" $(get_git_branch)`
    local -h right_prompt_naked
    right_prompt_naked="$branch_" # Create string to calculate lenght
    (( right_prompt_length = $(printf "%s" "$right_prompt_naked" | wc -m) ))
}

update_termwidth() { termwidth="$COLUMNS" }
# Callback called by zsh when resizing the terminal
TRAPWINCH() { update_termwidth }

update_curdir() { dir_=`printf "%s" "${PWD/#$HOME/~}"` }
# Callback called by zsh when changing dir
chpwd() { update_curdir ; update_left_prompt }

# Refresh prompt at the start of zsh by calling all refresh functions
update_termwidth
update_curdir

# Callback called by zsh before showing the prompt.
precmd() {

    time_=`date +%T`

    update_left_prompt
    update_right_prompt

    local -h total_length
    (( total_length = left_prompt_length + right_prompt_length ))

    # Create padding to align right in the current line. Long prompts
    # (because of a long path, for example) use more than one line, align to
    # the first possible line in that case.
    local -h padding_length padding
    (( padding_length = termwidth - (total_length % termwidth) ))
    padding=`printf '%*s' "$padding_length"` # String with lots of spaces

    local -h final_prompt
    final_prompt=(
        "%B"
        "%f%k" "$time_ "
        "%F{green}"  "$user"  "%F{yellow}"  "@"  "%F{green}"  "$host "  "%f"
        "%F{blue}"  "[$dir_]"  "%f%k"
        "%b"
        "$padding"
        "%F{yellow}"  "$branch_"  "%f"
        $'\n'
        "%B"  ">>> "  "%b"
    )

    # Tell zsh to use this string as prompt
    PS1="${(j::)final_prompt}"
}
