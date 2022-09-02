" Grabbed this from:
" https://gist.github.com/simonista/8703722
"
" # My changes: (wxh249 additions)  are at the bottom.
"
" Don't try to be vi compatible

set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key (probably pick space instead)
" let mapleader = ","

" Security
set modelines=0

" Show line numbers (see alt setup below)
" set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
" :help gk
" This is overkill - commenting out for now
" Better to leearn to use gj when editing
" nnoremap j gj
" nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme nord
colorscheme spaceway

" ===============================
" wxh249 additions:

" (grr) stop bilnking too!
set vb t_vb=

" Show invisibles like in VSCode is a pain in the butt in vim.
" Just run :set list when you really want to see them.
set nolist
set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,space:·

" higlight the current cursor line
set cursorline

" Use a line cursor within insert mode and a block cursor everywhere else.
" Also - get blinky with it.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Insert mode mappings to mimic some the emacs keybindings ctrl-n and ctrl-p are obviously a bad idea:
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Delete>
inoremap <C-k> <C-o>D
inoremap ;; <Esc>

" Need to rethink these - the <C-m> one is causing problems
" inoremap <A-m> <Esc>
" inoremap <D-m> <Esc>
" inoremap <C-m> <Esc>

" Now lets add the Control + vim motions to normal mode
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l

" Move lines up and down (using option down/up like in VSCode)
nnoremap <A-Down> :m+<CR>==
nnoremap <A-Up> :m-2<CR>==
inoremap <A-Down> <Esc>:m+<CR>==gi
inoremap <A-Up> <Esc>:m-2<CR>==gi
vnoremap <A-Down> :m'>+<CR>gv=gv
vnoremap <A-Up> :m-2<CR>gv=gv

" set number relativenumber

" fancy number toggle thing from https://jeffkreeftmeijer.com/vim-number/
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


