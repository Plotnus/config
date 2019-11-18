set nocompatible
"------------------------------------------------------------
map <space> <leader>
" have `Y` work like `D` and `C`
nnoremap Y y$ 

set number ruler
set cmdheight=2
set visualbell

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" search settings
set hlsearch incsearch ignorecase smartcase

" Enable use of the mouse for all modes
set mouse=a

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" when we horizontal split have cursor below, when vsp, cursor to right
set splitright splitbelow

" TODO(plot) this is kind of specific to LCS
set signcolumn=yes

" Plugins:
let s:plugin_directory = '~/.local/share/nvim/plugged'
call plug#init(s:plugin_directory)
"call plug#begin(g:foo)

"VIM enhancements
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
" Modelines have historically been a source of security vulnerabilities.
Plug 'ciaranm/securemodelines'
set nomodeline

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'

" Syntactic Language Support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'

" Fzf for fuzzy find and integration with LanguageClient-neovim
Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do':'./install --all' }
Plug 'junegunn/fzf.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorthemes
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'chriskempson/base16-vim'
"Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
call plug#end()



" Settings: Colortheme
syntax on
set termguicolors
color gruvbox
let g:gruvbox_contrast_dark = "medium" 


" Fzf_Settings:
"let g:fzf_action = {
"\ 'ctrl-t': 'tab split',
"\ 'ctrl-x': 'split',
"\ 'ctrl-v': 'vsplit',
"\}
"let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent><c-p> :GFiles<CR>

" NERDTree_settings:
nnoremap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '📁'
let g:NERDTreeDirArrowCollapsible = '📂'

" Lightline_settings:
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

" tabs/spaces
if has("autocmd")
    " use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " specify tab settings for Makefiles
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab


set hidden

" CoC:

"Show type info (and short doc) of identifier under cursor.
"function SetLspShortcuts()
    " code navigation
    nmap <leader>ld <Plug>(coc-definition)
    nmap <leader>lt <Plug>(coc-type-definition)
    nmap <leader>li <Plug>(coc-implementation)
    nmap <leader>lr <Plug>(coc-references)
    "nnoremap <leader>ld <Plug>(coc-definition)
    "nnoremap <leader>lt <Plug>(coc-type-definition)
    "nnoremap <leader>li <Plug>(coc-implementation)
    "nnoremap <leader>lr <Plug>(coc-references)
    " diagnostics
    nmap <leader>ln <Plug> (coc-diagnostic-next)
    nmap <leader>lN <Plug> (coc-diagnostic-prev)
    "nnoremap <leader>ln <Plug> (coc-diagnostic-next)
    "nnoremap <leader>lN <Plug> (coc-diagnostic-prev)
    " renaming
    nnoremap <leader>rn <Plug> (coc-rename)
    " format selected region
    xmap <leader>rn <Plug> (coc-format-selected)
    nmap <leader>rn <Plug> (coc-format-selected)
"endfunction


" TODO: determine if this is still needed
set updatetime=300

"" Language: Rust
"let g:rustfmt_autosave = 1


"-------------------------------------------------------------------------------
" Disable Auto-Comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#EBEBEB
highlight SpecialKey guifg=#EBEBEB

 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Always display the status line, even if only one window is displayed
set laststatus=2
""------------------------------------------------------------------------------
" 
"" Map <C-L> (redraw screen) to also turn off search highlighting until the
"" next search
nnoremap <C-L> :nohl<CR><C-L>
"
"
