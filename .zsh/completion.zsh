# Completion options

# Add custom completions to path
fpath=(${ZDOTDIR}/completions $fpath)

# Set ZSH_CACHE_DIR to the path where cache files should be created
ZSH_CACHE_DIR="${ZDOTDIR}/cache"

# Save the location of the current completion dump file
ZSH_COMPDUMP="${ZDOTDIR}/.zcompdump"

if [ -z "$skip_global_compinit" ]; then
   autoload -U compinit
   compinit -i -d "${ZSH_COMPDUMP}"
fi

zmodload -i zsh/complist

# Show completion menu after the second tab press requesting completion
setopt auto_menu
# On an ambiguous completion, do not autoselect the first match
unsetopt menu_complete
# Disable start/stop characters in the shell's editor
unsetopt flow_control
# Move cursor to the end of the word after a single match or completion menu
setopt always_to_end
# Sort filenames with numbers numerically rather than lexicographically
setopt numeric_glob_sort
# Append '/' after completing a directory name
setopt mark_dirs

# Use caching so that it is practical to complete commands like apt and dpkg.
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# For all completion options, enable completion menu. Instead of selecting
# completions with tab, open completion menu and let the user select with the
# arrow keys.
#zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select

# If the list of matches in the menu is too long, the menu lets the user scroll.
# This option displays a message on the bottom with the current number of line
# and the total of lines that form the menu.
zstyle ':completion:*' select-prompt '%BScrolling active: current selection at %L%b'

# Don't insert a tab character when pressing tab in an empty command line
zstyle ':completion:*' insert-tab false

# Warning message to show when there are no available completions (bold).
zstyle ':completion:*:warnings' format '%BNo matches found for: %d%b'

# When available, use a verbose completion style instead of a simple one.
zstyle ':completion:*' verbose yes

# Ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# When a completion menu is open, show the description of the field to complete.
# Use the specified format.
zstyle ':completion:*:descriptions' format '%B -- %d -- %b'

# In lists, enable case sensitive, partial-word and substring completion. For
# example, for man pages, 'man intf<tab>' will suggest printf.
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

# When completing paths of files and directories, colorize with $LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# For kill, change format of the list to PID USER NAME
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# Colorize format
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# For killall, show all processes, not just the ones of this user
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

# When completing a 'man' command, show the different sections available for all
# the suggested pages.
zstyle ':completion:*:manuals'   separate-sections true
# Insert number of section between 'man' and the name of the page.
zstyle ':completion:*:manuals.*' insert-sections   true
# Open menu as soon as tab is pressed.
zstyle ':completion:*:man:*'     menu yes select
