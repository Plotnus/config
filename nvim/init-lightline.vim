" NOTE: This file must be called after `plug#begin(...)`
" NOTE: This file must be before `plug#end()`

Plug 'itchyny/lightline.vim'
" My use of vim-gitbranch is only to extend lightline functionality
Plug 'itchyny/vim-gitbranch'

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

