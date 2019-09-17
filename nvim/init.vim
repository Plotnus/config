"------------------------------------------------------------
"   Generated Files
"-------------------------------------------------------------------------------
" TODO setup swapfile dir and other file dir for neovim

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

" Section:  LanguageClient-neovim - Language Server Settings
set hidden
" TODO: setup for ccls
let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\}

" Section: LanguageClient-neovim - Keybindings

"Show type info (and short doc) of identifier under cursor.
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

"Goto definition under cursor.
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

"TODO: enable and setup bindings
"Goto type definition under cursor.
"nnoremap <silent> ?? LanguageClient#textDocument_typeDefinition()<CR>

"TODO: enable and setup bindings
"Goto implementation under cursor.
"nnoremap <silent> ?? LanguageClient#textDocument_implementation()<CR>

"TODO: enable and setup bindings
"Show list of all available actions.
"nnoremap <silent> ?? LanguageClient#contextMenu()<CR>

"Rename identifier under cursor.
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
""TODO: tryiout 'tpope/vim-abolish'
"" Rename - rn => rename
"noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
"
"" Rename - rc => rename camelCase
"noremap <leader>rc :call LanguageClient#textDocument_rename(
"            \ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>
"
"" Rename - rs => rename snake_case
"noremap <leader>rs :call LanguageClient#textDocument_rename(
"            \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
"
"" Rename - ru => rename UPPERCASE
"noremap <leader>ru :call LanguageClient#textDocument_rename(
"            \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>

"List of current buffer's symbols.
"nnoremap <leader> LanguageClient#textDocument_documentSymbol()<CR>

"List all references of identifier under cursor.
"nnoremap <leader> ?? LanguageClient#textDocument_references()<CR>

"List all references of identifier under cursor.
"nnoremap <leader> ?? LanguageClient#textDocument_codeAction()<CR>

"Get a list of completion items at current editing location.
"Note, this is a synchronous call.
"When using a supported completion manager (deoplete and
"nvim-completion-manager are supported), completion should work out of the box.
"nnoremap <leader> ?? LanguageClient#textDocument_completion()<CR>


"Format current document.
"nnoremap <leader> ?? LanguageClient#textDocument_formatting()<CR>

"Format selected lines.
"nnoremap <leader> ?? LanguageClient#textDocument_rangeFormatting()<CR>l

"TODO would be nice to just have a way to toggle, and to tie this into jumping using n, and N
"Highlight usages of the symbol under the cursor.
"LanguageClient#textDocument_documentHighlight()
"Clear the symbol usages highlighting.
"*LanguageClient#clearDocumentHighlight()*

"List of project's symbols.
"LanguageClient#workspace_symbol()*

"Apply a workspace edit.
"LanguageClient#workspace_applyEdit()

" TODO figure out how to do the formatting range
"      To use the language server with Vim's formatting operator.
"      this should change with formatter, eg clang-format, RustFmt ...etc
"      section 2.2 of LanguageClient makes me thing I may need to install ale
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"LanguageClient#contextMenu()<CR>
"LanguageClient#textDocument_hover()<CR>
" TODO: maybe add command for going to docs

" TODO: Try out FZF
" TODO: decide if should give denite a go

" TODO: determine if this is still needed
set updatetime=300

"" Language: Rust
let g:rustfmt_autosave = 1


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
