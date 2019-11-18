" NOTE: This file must be called after `plug#begin(...)`
" NOTE: This file must be before `plug#end()`
" This was added as a seperate file so it would be easy to
" switch between coc and other plugin

" Use the plugin manager to get the plugin
Plug 'scrooloose/nerdtree'

nnoremap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '📁'
let g:NERDTreeDirArrowCollapsible = '📂'
