Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F2> 




" TODO: remap for language client
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>li :call LanguageClient#textDocument_implementation()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_references()<CR>
" diagnostics
" list diagnostics
nnoremap <leader>ln :call LanguageClient#setDiagnosticsList()
"nnoremap <leader>lN :call Diagnostic-Prev

nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" renaming
nnoremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
" region format
nnoremap <leader>rf :call LanguageClient#textDocument_rangeFormatting()

set signcolumn=yes
" TODO have nightly generated from bash or something
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ }

