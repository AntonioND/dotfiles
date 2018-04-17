# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# [PageUp] Up a line of history
bindkey "${terminfo[kpp]}" up-line-or-history
# [PageDown] Down a line of history
bindkey "${terminfo[knp]}" down-line-or-history

# [UpArrow] Fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# [DownArrow] Fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# [Home] Go to beginning of line
bindkey "${terminfo[khome]}" beginning-of-line
# [End] Go to end of line
bindkey "${terminfo[kend]}"  end-of-line

# [Ctrl-RightArrow] Move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] Move backward one word
bindkey '^[[1;5D' backward-word

# This is a list of characters that are considered part of a word. It is used
# when moving inside the command line with Ctrl-Left and Ctrl-Right. This setup
# makes the cursor stop at any special character.
# The default is ```*?_-.[]~=/&;!#$%^(){}<>```, which is not what we want, we
# want to be able to stop at, at least, the divisions between directories in a
# path.
WORDCHARS=''

# [Shift-Tab] Move through the completion menu backwards
bindkey "${terminfo[kcbt]}" reverse-menu-complete

# [Backspace] Delete backward
bindkey '^?' backward-delete-char

# [Delete] Delete forward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# [Ctrl-x Ctrl-e] Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# [Esc m] Duplicate previous word to cursor
bindkey "^[m" copy-prev-shell-word
