""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHARED SETTINGS ACROSS vscode & nvim
set nocompatible
" have `Y` work like `D` and `C`
nnoremap Y y$ 
map <space> <leader>
" Dear nvim, please help me learn by letting me know when I make a mistake.
set visualbell
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: just have a seperate config for vscode
" TODO: clean up this vscode fork in the init.vim
" TODO: would be nice to play around with tpope's vimsuround
" henceforth thee shall be nvim specific!!
if !("g:vscode")

  set number ruler
  
  " search settings
  set hlsearch incsearch ignorecase smartcase

  " Enable use of the mouse for all modes
  set mouse=a

  " Allow backspacing over autoindent, line breaks and start of insert action
  set backspace=indent,eol,start

  " Ex Cmdline
  set cmdheight=2
  " Better command-line completion
  set wildmenu
  " Show partial commands in the last line of the screen
  set showcmd

  " when we horizontal split have cursor below, when vsp, cursor to right
  set splitright splitbelow
  
  "{{{ PLUG:
  call plug#begin('~/.local/share/nvim/plugged')
  "VIM enhancements
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'

  " Modelines have historically been a source of security vulnerabilities.
  Plug 'ciaranm/securemodelines'
  set nomodeline
  
  " Syntactic Language Support
  Plug 'cespare/vim-toml'
  Plug 'rust-lang/rust.vim'
  Plug 'tikhomirov/vim-glsl'
  
  " Section: COLORTHEMES
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'

  Plug 'itchyny/lightline.vim'  " Section: LIGHTLINE
  " My use of vim-gitbranch is used only to extend lightline functionality
  Plug 'itchyny/vim-gitbranch'
  
  Plug 'scrooloose/nerdtree'  " Section: NERDTREE

  Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do':'./install --xdg --all' }
  Plug 'junegunn/fzf.vim'  " Section: FZF

  Plug 'Yggdroot/indentLine'  " Section: INDENTLINE

  Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Section: COC

  Plug 'rhysd/vim-llvm'

  call plug#end()
  "}}}
  "{{{ COC
  " Keybinds: 
  nmap <leader>ld <Plug>(coc-definition)
  nmap <leader>lt <Plug>(coc-type-definition)
  nmap <leader>li <Plug>(coc-implementation)
  nmap <leader>lr <Plug>(coc-references)
  nmap <leader>la <Plug>(coc-code-action)
  " diagnostics
  nmap <leader>ne <Plug>(coc-diagnostic-next)
  nmap <leader>Ne <Plug>(coc-diagnostic-prev)

  " renaming
  nnoremap <leader>rn <Plug>(coc-rename)
  " region format
  xmap <leader>rf <Plug>(coc-format-selected)
  nmap <leader>rf <Plug>(coc-format-selected)
  "}}}
  "{{{ INDENTLINE
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  "}}}
  "{{{ NERDTREE
  nnoremap <leader>nt :NERDTreeToggle<CR>
  let g:NERDTreeDirArrowExpandable = '📁'
  let g:NERDTreeDirArrowCollapsible = '📂'
  "}}}
  "{{{FZF
  " Keybinds:
  nnoremap <silent><c-p> :GFiles<CR>

  " Settings:
  let g:fzf_layout = { 'down': '~40%' }
  let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \}
  "}}}
  "{{{ LIGHTLINE
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
  "}}}
  "{{{ COLORTHEMES
  let g:gruvbox_contrast_dark = "medium" 

  syntax on
  set termguicolors
  color gruvbox
  "}}}
  "{{{ VIM-LLVM
  let g:llvm_extends_official = 1
  let g:llvm_ext_no_mapping = 0

  " if custom goto mapping is desired there are options.
  " preferably have these use things like 'coc-definition"
  "autocmd FileType llvm nmap <buffer><silent>gd <Plug>(llvm-goto-definition)
  "}}}
  "{{{ FOLDMETHOD
  set foldmethod=manual
  autocmd FileType vim setlocal foldmethod=marker
  "}}}
  
  " tabs and spaces
  if has("autocmd")
    " use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " specify tab settings for Makefiles
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType vim set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  endif
  set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

  " When opening a new line and no filetype-specific indenting is enabled, keep
  " the same indent as the line you're currently on. Useful for READMEs, etc.
  set autoindent

  " Use the same symbols as TextMate for tabstops and EOLs
  set listchars=tab:▸\ ,eol:¬
  "Invisible character colors 
  highlight NonText guifg=#EBEBEB
  highlight SpecialKey guifg=#EBEBEB
  
  set hidden
  set updatetime=300
  
  " Disable Auto-Comment
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  
  " Always display the status line, even if only one window is displayed
  set laststatus=2

  ""------------------------------------------------------------------------------
  "" Map <C-L> (redraw screen) to also turn off search highlighting until the
  "" next search
  nnoremap <C-L> :nohl<CR><C-L>
endif
