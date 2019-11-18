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

" Plugins:
let s:plugin_directory = '~/.local/share/nvim/plugged'
call plug#init(s:plugin_directory)

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

source ~/.config/nvim/init-colorthemes.vim
source ~/.config/nvim/init-lightline.vim
source ~/.config/nvim/init-nerdtree.vim
source ~/.config/nvim/init-fzf.vim
source ~/.config/nvim/init-coc.vim

call plug#end()


syntax on
set termguicolors
color gruvbox

" tabs/spaces
if has("autocmd")
  " use filetype detection and file-based automatic indenting.
  filetype plugin indent on
  " specify tab settings for Makefiles
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
  autocmd FileType vim set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endif
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set hidden
set updatetime=300

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
