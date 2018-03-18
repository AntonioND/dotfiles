" ~/.vim/.config/nvim should be a link to ~/.vim

" Set paths
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath   = &runtimepath

" Put all temporary files under the same directory.
"set backup
"set backupdir   =$HOME/.vim/files/nvim/backup/
"set backupext   =-vimbackup
"set backupskip  =
"set directory   =$HOME/.vim/files/nvim/swap/
"set updatecount =100
"set undofile
"set undodir     =$HOME/.vim/files/nvim/undo/
set viminfo     ='100,n$HOME/.vim/files/nvim/viminfo

" Disable backup files and viminfo. Keep swap files in the working directory.
set nobackup
"set viminfo     =

" Load common config
source ~/.vim/vimrc-common
