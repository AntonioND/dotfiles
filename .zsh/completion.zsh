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

# do not autoselect the first completion entry
unsetopt menu_complete
unsetopt flowcontrol
# show completion menu on successive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extended_glob
# Do globbing on unquoted command parameters like "param=value"
setopt magic_equal_subst
setopt numeric_glob_sort
setopt mark_dirs
setopt rc_expand_param

bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select

# case sensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

# Ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# ... unless we really want to.
zstyle '*' single-ignored show

# Take advantage of $LS_COLORS for completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
