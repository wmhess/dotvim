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
Plugin 'git://github.com/gmarik/vundle.git'

" My Plugins will plug-in here:
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git@github.com:honza/vim-snippets.git'
Plugin 'git@github.com:SirVer/ultisnips.git'
Plugin 'vim-colorschemes'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:mattn/emmet-vim.git'
Plugin 'git@github.com:Lokaltog/vim-easymotion.git'
Plugin 'git@github.com:terryma/vim-multiple-cursors.git'
Plugin 'git@github.com:itchyny/lightline.vim.git'
"Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-unimpaired'
Plugin 'git@github.com:tpope/vim-vinegar.git'
"Plugin 'tpope/vim-surround'
"Plugin 'ScrollColors', {'pinned' : 1}
"Plugin 'bling/vim-airline'
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
set guifont=Menlo\ Regular\:h15
" allow hidden buffers without warning.
set hidden
set linespace=7
colorscheme void
"trying out automatically changing the colorscheme for .txt files
autocmd BufEnter *.html colorscheme kellys
autocmd BufEnter *.txt colorscheme void

" turn off the swap files
set noswapfile

" not really digging this remap anymore - gonna try using the default for a
" while 
"let mapleader=","
"noremap \ ,

" This mapping sets up Y to be consistent with the C and D operators, which act from the cursor to the end of the line. 
" The default behavior of Y is to yank the whole line.
nnoremap Y y$

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0 " this keeps vim from adding a new line character when a word reaches the edge.
set formatoptions+=1


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" trying out save on escape from insert - this currently works when typing Ctl [ twice.
" that way typing Ctl [ once or ;; twice is still just escape.
inoremap <Esc><Esc> <Esc>:w<CR>

" try this for automatically changing the working directory to the curent
" file's path
autocmd BufEnter * lcd %:p:h

" Let's do the Twiddle Case : http://vim.wikia.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


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
set listchars=tab:›_,trail:․,eol:¬

"" Whitespace
" don't wrap lines
"set nowrap
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
inoremap jj <Esc>
" Set %% as a shortcut to get the path of the active buffer:
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"nnoremap <esc> :noh<return><esc>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" set wrapmargin=5
noremap <C-c> "*yy
vnoremap <C-c> "*y

"EasyMotion minimal stuff - let's figure out how to use this thing.
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_us

" Source the vimrc file after saving it: http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" make it as easy as possible to open my vimrc file
nmap <leader>v :tabedit $MYVIMRC<CR>

" simplify working with split windows - http://vimcasts.org/episodes/working-with-windows/
" nice idea, but it conflicts with how I have UltiSnips set up - I kinda like
" the longer format with the w for now anyway - leaving it here until I get
" used to using UtliSnips.
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" trying out this trim whitspace thing from: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
autocmd BufWritePre *.txt,*.html :%s/\s\+$//e

" ultisnips setup
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
