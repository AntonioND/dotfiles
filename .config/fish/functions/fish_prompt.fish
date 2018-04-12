# Setup prompt so that it has the following form:
# `HH:MM:SS [current-path]                 git-describe`

function fish_prompt

    set -l time_ (date +%T) # HH:MM:SS
    # The path substitution won't work if the path has a '`'
    set -l dir_ (echo "$PWD" | sed "s`$HOME`~`")
    set -l branch (printf "%s" (git_get_branch))

    # Create string to calculate length. Time always uses the same space
    set -l left_prompt_naked "00:00:00 [$dir_]"
    set -l left_prompt_length (printf "%s" "$left_prompt_naked" | wc -m)

    # Create string to calculate length
    set -l right_prompt_length (printf "%s" "$branch" | wc -m)

    # Calculate total length
    set -l total_length (math $left_prompt_length + $right_prompt_length)

    # Create padding to align right in the current line. Long prompts
    # (because of a long path, for example) use more than one line, align to
    # the first possible line in that case. Create a long string of spaces
    # between both parts of the prompt.
    set -l padding_length (echo "$COLUMNS - ($total_length % $COLUMNS)" | bc)
    set -l padding (printf '%*s' "$padding_length")

    # Print final prompt
    set_color --bold white
    printf "$time_ "

    set_color --bold blue
    printf "[$dir_]"

    set_color normal
    printf "$padding"

    set_color yellow
    echo "$branch" # Add newline

    set_color --bold white
    printf ">>> "

    set_color normal

end
