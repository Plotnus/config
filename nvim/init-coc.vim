" NOTE: This file must be called after `plug#begin(...)`
" NOTE: This file must be before `plug#end()`

" This was added as a seperate file so it would be easy to
" switch between coc and other plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Keybinds: 
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lt <Plug>(coc-type-definition)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lr <Plug>(coc-references)
" diagnostics
nmap <leader>ln <Plug> (coc-diagnostic-next)
nmap <leader>lN <Plug> (coc-diagnostic-prev)
" renaming
nnoremap <leader>rn <Plug> (coc-rename)
" region format
xmap <leader>rf <Plug> (coc-format-selected)
nmap <leader>rf <Plug> (coc-format-selected)
