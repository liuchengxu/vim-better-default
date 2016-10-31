" default.vim - Better vim than the default
" Maintainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:      0.1
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

if &compatible || (exists('g:loaded_vim_better_default') && g:loaded_vim_better_default)
   finish
endif
let g:loaded_vim_better_default = 1

set shortmess=atI
set background=dark

filetype plugin indent on  " Automatically detect file types
syntax on                  " Syntax highlighting
set mouse=a                " Automatically enable mouse usage
set mousehide              " Hide the mouse cursor while typing

set cursorline             " Highlight current line

set spell                  " Spell checking on
set hidden                 " Allow buffer switching without saving

set t_Co=256               " Use 256 colors

set ruler                  " Show the ruler
set showcmd                " Show partial commands in status line and Selected characters/lines in visual mode
set showmode               " Display current mode

set winminheight=0
set wildmode=list:longest,full
set wildmenu

highlight clear SignColumn
highlight clear LineNr

set linespace=0                " No extra spaces between rows
set backspace=indent,eol,start " Backspace for dummies

set incsearch     " Find as you type search
set hlsearch      " Highlight search terms
set ignorecase    " Case sensitive search
set smartcase     " Case sensitive when uc present
set scrolljump=5  " Line to scroll when cursor leaves screen
set scrolloff=3   " Minumum lines to keep above and below cursor

set number        " Line numbers on
set showmatch     " Show matching brackets/parentthesis
set matchtime=5   " Show matching time
set laststatus=2  " Always show status line

set nowrap        " Do not wrap long lines
set autoindent    " Indent at the same level of the previous line
set shiftwidth=4  " Use indents of 4 spaces
set smarttab      " Smart tab
set expandtab     " Tabs are spaces, not tabs
set tabstop=4     " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set splitright    " Puts new vsplit windows to the right of the current
set splitbelow    " Puts new split windows to the bottom of the current

set wildignore+=*swp,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe  " Windows

set autoread   " Automatically read a file detected be have been changed outside of vim
set autowrite  " Automatically write a file when leaving a modified buffer

set viminfo+=!

if has('clipboard')
    set clipboard=unnamed
endif

if has('persistent_undo')
  set undofile             " Persistent undo
  set undolevels=1000      " Maximum number of changes that can be undone
  set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
endif

set linebreak

if has('gui_running')
  set guioptions-=r       " Hide the right scrollbar
  set guioptions-=L       " Hide the left scrollbar
  set guioptions-=T
  set guioptions-=e
  set shortmess+=c
  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set t_vb=
endif

" Key (re)Mappings {

if !exists('g:vim_better_default_key_mapping') || g:vim_better_default_key_mapping

  " Basic {
  if !exists('g:vim_better_default_basic_key_mapping') || g:vim_better_default_basic_key_mapping

    map <leader>' :shell<CR>

    " Quit normal mode
    nmap <Leader>q  :q<CR>
    nmap <Leader>Q  :qa!<CR>
    " Move half page faster
    nmap <Leader>d  <C-d>
    nmap <Leader>u  <C-u>

    " Insert mode shortcut
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-l> <Right>
    inoremap <C-d> <Delete>

    " Quit insert mode
    inoremap jj <Esc>
    inoremap jk <Esc>
    inoremap kk <Esc>
    inoremap ;; <Esc>

    " Quit visual mode
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
    " auto indent pasted text
    nnoremap p p=`]<C-o>

    " Treat long lines ad break lines (useful when moving around in them)
    map j gj
    map k gk

    " 当遇到没有行号的行时，gj/gk 命令会使光标按虚拟行移动，而当遇到有行号的行时，光标则按物理行移动。
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    nmap <Leader>sc :nohl<CR>       " 搜索完成后去掉搜索结果高亮
  endif
  " }

  " Window {
  if !exists('g:vim_better_default_window_key_mapping') || g:vim_better_default_window_key_mapping
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
  endif
  " }

  " Buffer {
  if !exists('g:vim_better_default_buffer_key_mapping') || g:vim_better_default_buffer_key_mapping
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
  endif
  " }

endif
" }
