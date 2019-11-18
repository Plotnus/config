" NOTE: This file must be called after `plug#begin(...)`
" NOTE: This file must be before `plug#end()`

Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do':'./install --all' }
Plug 'junegunn/fzf.vim'

" Keybinds:
nnoremap <silent><c-p> :GFiles<CR>

" Settings:
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit',
\}
