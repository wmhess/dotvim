" Stuff from Vundle:
" ===============================
" be iMproved, required
set nocompatible
" required
filetype off
filetype plugin on

if !has('gui_running')
  set t_Co=256
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)
" let Vundle manage Vundle, required
Plugin 'git://github.com/gmarik/vundle.git'

" My Plugins will plug-in here:
Plugin 'git@github.com:flazz/vim-colorschemes.git'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:rstacruz/sparkup.git'
Plugin 'git@github.com:tomtom/tcomment_vim.git'
Plugin 'git@github.com:yonchu/accelerated-smooth-scroll.git'
Plugin 'git@github.com:itchyny/lightline.vim.git'
Plugin 'git@github.com:tpope/vim-unimpaired.git'
Plugin 'git@github.com:tpope/vim-repeat.git'
Plugin 'git@github.com:tpope/vim-vinegar.git'
Plugin 'git@github.com:nelstrom/vim-visual-star-search.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'git@github.com:tpope/vim-surround'
Plugin 'git@github.com:jlanzarotta/bufexplorer.git'
Plugin 'git@github.com:gcmt/wildfire.vim.git'
Plugin 'git@github.com:tpope/vim-haml.git'
" My meh list: and what do you care?
"Plugin 'git@github.com:tpope/vim-commentary.git'
"Plugin 'git@github.com:SirVer/ultisnips.git'
"Plugin 'git@github.com:mattn/emmet-vim.git'
"Plugin 'git@github.com:scrooloose/nerdcommenter.git'
"Plugin 'git@github.com:terryma/vim-multiple-cursors.git'
"Plugin 'git@github.com:honza/vim-snippets.git'
"Plugin 'git@github.com:Valloric/YouCompleteMe.git'
"Plugin 'git@github.com:Lokaltog/vim-easymotion.git'
"Plugin 'Valloric/MatchTagAlways'
"Plugin 'ScrollColors', {'pinned' : 1}
"Plugin 'bling/vim-airline'
"Plugin 'git://git.wincent.com/command-t.git'
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
set guifont=Menlo\ Bold:h15
" allow hidden buffers without warning.
set hidden
set linespace=7
colorscheme hybrid
"trying out automatically changing the colorscheme for .txt files
"autocmd BufEnter *.html colorscheme kali
"autocmd BufEnter *.txt colorscheme kali

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
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" I really want to like Multiple Cursors - but.. 
" Hopefully this highligting setting will help with that.
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" See if this makes the command line any better - some of it doesn't look right on the mac - where's the ctrl-k?:
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" Lightline stuff
set noshowmode
set laststatus=2
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'tabline_separator': { 'left': "", 'right': "" },
"      \ 'tabline_subseparator': { 'left': "", 'right': "" },
"      \ }
"	let g:lightline = {
"		\ 'colorscheme': 'wombat',
"		\ 'active': {
"		\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
"		\ },
"		\ 'component_function': {
"		\   'fugitive': 'MyFugitive',
"		\   'filename': 'MyFilename'
"		\ }
"		\ }
"	function! MyModified()
"		return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"	endfunction
"	function! MyReadonly()
"		return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
"	endfunction
"	function! MyFilename()
"		return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"		\ (&ft == 'vim:filer' ? vimfiler#get_status_string() :
"		\  &ft == 'unite' ? unite#get_status_string() :
"		\  &ft == 'vimshell' ? vimshell#get_status_string() :
"		\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"		\ ('' != MyModified() ? ' ' . MyModified() : '')
"	endfunction
"	function! MyFugitive()
"		if &ft !~? 'vimfiler' && exists("*fugitive#head")
"			return fugitive#head()
"		endif
"		return ''
"	endfunction
"
"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

