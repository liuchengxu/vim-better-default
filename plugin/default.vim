" default.vim - Better vim than the default
" Maintainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:      0.1

if exists('g:loaded_vim_better_default') || &compatible
   finish
else
    let g:loaded_vim_better_default = 1
endif

set autoread
set autowrite
set mouse=a

if has('clipboard')
    set clipboard=unnamed
endif

" quit
nmap <leader>q  :q<CR>
nmap <leader>Q  :qa!<CR>
" move half page faster
nmap <leader>d  <C-d>
nmap <leader>u  <C-u>

" auto indent pasted text, 自动缩进粘贴文本
nnoremap p p=`]<C-o>

set wildignore+=*swp,*.pyc,*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.zip,*.exe  " Windows

set ruler
set showcmd
set showmode

set nowrap
set linebreak

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

set number
set showmatch
set matchtime=5

set cindent
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Delete>
" quit insert mode
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
inoremap ;; <Esc>

vnoremap v <Esc>
" move to the start of line
nnoremap H ^
" move to the end of line
nnoremap L $

" yank to the end of line
nnoremap Y y$
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" Treat long lines ad break lines (useful when moving around in them)
map j gj
map k gk
" 当遇到没有行号的行时，gj/gk 命令会使光标按虚拟行移动，而当遇到有行号的行时，光标则按物理行移动。
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Window {
nmap <Leader>ww <C-W>w
nmap <Leader>wr <C-W>r
nmap <Leader>wd <C-W>c
nmap <Leader>wq <C-W>q
nmap <Leader>wj <C-W>j
nmap <Leader>wk <C-W>k
nmap <Leader>wh <C-W>h
nmap <Leader>wl <C-W>l
nmap <Leader>ws <C-W>s
nmap <Leader>w- <C-W>s
nmap <Leader>wv <C-W>v
nmap <Leader>w\| <C-W>v
nmap <Leader>w2 <C-W>v
" }

" Buffer {
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bk :bw<CR>
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>

if has('gui_running')
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=T
    set guioptions-=e
    set shortmess+=c
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
endif

if has('autocmd')
    filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/bin/bash
endif

set autoread

if &history < 1000
    set history=1000
endif
if &tabpagemax < 50
    set tabpagemax=50
endif
if !empty(&viminfo)
    set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
