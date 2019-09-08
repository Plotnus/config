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
Plug 'ciaranm/securemodelines'
"Plug 'justinmk/vim-sneak' "TODO try out

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

" Code Completion and Navigation
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

" Settings: Coloration
set termguicolors
"color dracula
"color base16-default-dark
color gruvbox
"let g:gruvbox_contrast_dark = "soft"
"let g:gruvbox_contrast_dark = "hard"
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
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h


" Settings: Keybinds - CoC
set updatetime=300

" daignostics navigation aka errors and warnings
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" remap keys for gotos
" TODO see if these remap any other commands, consider prefixing with leader or space
nmap <silent> gd <Plug>(coc-definition)
" TODO: 'Type definition provider not found for current document' - on rust code
nmap <silent> gy <Plug>(coc-type-definition)
" TODO: understand why `gi` doesn't work on `new` in `Ipv4Addr::new(a,b,c,d)`
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)

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

"" ensure that vim will search for a rusty-tags.vi file upwards the dir hierarchy
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
"
"" ensures that tags file gets updated when a file is written to
"autocmd BufWritePost *.rs :silent! exec 
"    \ "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
"
"" for navigating to rust sources
"autocmd BufRead *.rs :setlocal
"    \ tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"
"" @section Racer
"set hidden "mode for buffers so dan't have to save everytime we use goto-definiton
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
"" Vim with default settings does not allow easy switching between multiple files
"" in the same editor window. Users can use multiple split windows or multiple
"" tab pages to edit multiple files, but it is still best to enable an option to
"" allow easier switching between files.
""
"" One such option is the 'hidden' option, which allows you to re-use the same
"" window and switch from an unsaved buffer without saving it first. Also allows
"" you to keep an undo history for multiple files when re-using the same window
"" in this way. Note that using persistent undo also lets you undo in multiple
"" files even in the same window, but is less efficient and is actually designed
"" for keeping undo history after closing Vim entirely. Vim will complain if you
"" try to quit without saving, and swap files will keep you safe if your computer
"" crashes.
"set hidden
" 
"" Note that not everyone likes working this way (with the hidden option).
"" Alternatives include using tabs or split windows instead of re-using the same
"" window as mentioned above, and/or either of the following options:
"" set confirm
"" set autowriteall
" 
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
 
" Use visual bell instead of beeping when doing something wrong
 
"" Enable use of the mouse for all modes
"set mouse=a
 

" Display line numbers on the left
" 
"" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200
" 
"" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>
" 
"" highlight the current line
"" set cursorline
"
""-------------------------------------------------------------------------------
"" Indentation options {{{1
""
"" Indentation settings according to personal preference.
" 
"" Indentation settings for using 4 spaces instead of tabs.
"" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab
" 
"" Indentation settings for using hard tabs for indent. Display tabs as
"" four characters wide.
""set shiftwidth=4
""set tabstop=4
" 
" 
""------------------------------------------------------------------------------
" 
"" Map <C-L> (redraw screen) to also turn off search highlighting until the
"" next search
nnoremap <C-L> :nohl<CR><C-L>
"
"
