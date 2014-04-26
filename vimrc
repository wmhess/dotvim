" Stuff from Vundle:
" ===============================
" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" My Plugins will plug-in here:
Plugin 'Command-T'
" ...

" required
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
" =============================

" =============================
" And now for My Stuff:
" =============================
set noeb vb t_vb=
set guifont=Menlo\ Regular:h15
colorscheme kellys
let mapleader=","

" =================================================
" Stuff from Mislav's post @:
" http://mislav.uniqpath.com/2011/12/vim-revisited/
" =================================================
syntax enable
set encoding=utf-8
" display incomplete commands
set showcmd
" load file type plugins + indentation
filetype plugin indent on
" show line numbers
set number
" show invisibles
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"" Whitespace
" don't wrap lines
set nowrap
" a tab is two spaces (or set this to 4)
"set tabstop=2 shiftwidth=2
" see the vimcast about tabs for an explanation of using this instead
set ts=4 sts=4 sw=4 noexpandtab
" use spaces, not tabs (optional)
" use spaces, not tabs (optional)
set expandtab
" backspace through everything in insert mode
set backspace=indent,eol,start

"" Searching
" highlight matches
set hlsearch
" incremental searching
set incsearch
" searches are case insensitive...
set ignorecase
" ... unless they contain at least one capital letter
set smartcase

hi Search ctermbg=black ctermfg=yellow term=underline

"================================================
" Stuff from vimcasts and the Practical Vim book:
" ===============================================
" a clever escape key remap
" it does weird things when you put comments on the same line right after it.
" that's why all my comments are on thier own line now.
inoremap ;; <Esc>
" Set %% as a shortcut to get the path of the active buffer:
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"nnoremap <esc> :noh<return><esc>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
