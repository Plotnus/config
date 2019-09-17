"------------------------------------------------------------
"   Generated Files
"-------------------------------------------------------------------------------
" TODO setup swapfile dir and other file dir for neovim
" TODO setup with XDG dirs

let autoload_dir=''
"-------------------------------------------------------------------------------
"   Plugin Manager
"-------------------------------------------------------------------------------
" install the plugin manager if we don't have it
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let plugin_dir='~/.local/share/nvim/plugged'
call plug#begin(plugin_dir)

"VIM enhancements
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'ciaranm/securemodelines'
"Use: So we can repeat motions and actions enabled by plugins
"Plug 'tpope/vim-repeat'

"TODO try out
"Plug 'justinmk/vim-sneak'

" Color Themes to Try
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Syntactic Language Support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

" TODO: decide whether to keep
Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'make release'
\}

call plug#end()

" Settings: Coloration
set termguicolors
"color dracula
"color base16-default-dark
color gruvbox
let g:gruvbox_contrast_dark = "medium"



" Settings: for lightline
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
      \ }

" Settings:
set cmdheight=2
set visualbell
" tabs/spaces
if has("autocmd")
    " use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " specify tab settings for Makefiles
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
set tabstop=4
set shiftwidth=4
set expandtab

" Settings: Keybinds - Native

" have `Y` yank till end of line
noremap Y y$
" TODO: decide whether to keep or ditch the keybinds for vim/tmux
"noremap <c-j> <c-w>j
"noremap <c-k> <c-w>k
"noremap <c-l> <c-w>l
"noremap <c-h> <c-w>h

" Section:  LanguageClient-neovim
set hidden
" TODO: setup for ccls
let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'cpp': ['~/.local/bin/ccls'],
        \ 'py' : ['~/.local/bin/pyls'],
\}
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Settings: Keybinds - CoC
set updatetime=300

" daignostics navigation aka errors and warnings
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)




" remap keys for gotos
" TODO see if these remap any other commands, consider prefixing with leader or space
"nmap <silent> gd <Plug>(coc-definition)
" TODO: 'Type definition provider not found for current document' - on rust code
"nmap <silent> gy <Plug>(coc-type-definition)
" TODO: understand why `gi` doesn't work on `new` in `Ipv4Addr::new(a,b,c,d)`
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> <F2> <Plug>(coc-rename)

" show documentation
" TODO: show documentation for rust std
nnoremap <silent> K :call <SID>show_documentation()<CR>

" TODO: add shortcuts for building
" TODO: add shortcuts for running

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"" Language: Rust
let g:rustfmt_autosave = 1

"" @section Racer
"let g:racer_cmd="/Users/plot/.cargo/bin/racer" "path to racer binary
"let g:racer_experimental_completer=1 " for showing function signature
"let g:racer_insert_paren=1 "insert the parenthesis in the completion
"" use <Ctl + x>, <Ctl + o> to see suggestions
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap gd <leader>(rust-doc)
"

""-------------------------------------------------------------------------------
" Disable Auto-Comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on

set number
set ruler

"" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#EBEBEB
highlight SpecialKey guifg=#EBEBEB

""-------------------------------------------------------------------------------
"" SECTION: INHERITED
""-------------------------------------------------------------------------------
"" interactive
"" set shellcmdflag -ic
""-------------------------------------------------------------------------------
"" URL: http://vim.wikia.com/wiki/Example_vimrc
"" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
"" Description: A minimal, but feature rich, example .vimrc. If you are a
""              newbie, basing your first .vimrc on this file is a good choice.
""              If you're a more advanced user, building your own .vimrc based
""              on this file is still a good idea.
"
""-------------------------------------------------------------------------------
" run in non vi compatible mode
set nocompatible
syntax on
"
"" Attempt to determine the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
filetype indent plugin on
"
""------------------------------------------------------------------------------
"" Better command-line completion
set wildmenu
"
"" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" search as characters are entered
set incsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline


"------------------------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

"" Enable use of the mouse for all modes
"set mouse=a

"" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200
"
"" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>
"
"" highlight the current line
"" set cursorline
"
""------------------------------------------------------------------------------
"
"" Map <C-L> (redraw screen) to also turn off search highlighting until the
"" next search
nnoremap <C-L> :nohl<CR><C-L>
"
"
