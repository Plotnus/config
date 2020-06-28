" NOTE: This file must be called after `plug#begin(...)`
" NOTE: This file must be before `plug#end()`

Plug 'itchyny/lightline.vim'
" My use of vim-gitbranch is only to extend lightline functionality
Plug 'itchyny/vim-gitbranch'

" I'm not sure why this is needed, or which of my machines had an issue ...
" lightline had some coloring issues and the main section reccomended this
if !has('gui_running')
  set t_Co=256
endif

" Settings:
" remove '-- INSERT --' since lightline shows it
set noshowmode
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name'
\ },
\}

