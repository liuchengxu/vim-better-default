" default.vim - Better vim than the default
" Maintainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:      0.1
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

if &compatible ||
      \ (exists('g:loaded_vim_better_default') && g:loaded_vim_better_default)
   finish
endif
let g:loaded_vim_better_default = 1

set shortmess=atI " No help Uganda information
set incsearch     " Find as you type search
set hlsearch      " Highlight search terms
set ignorecase    " Case sensitive search
set smartcase     " Case sensitive when uc present
set scrolljump=5  " Line to scroll when cursor leaves screen
set scrolloff=3   " Minumum lines to keep above and below cursor
set nowrap        " Do not wrap long lines
set autoindent    " Indent at the same level of the previous line
set shiftwidth=4  " Use indents of 4 spaces
set smarttab      " Smart tab
set expandtab     " Tabs are spaces, not tabs
set tabstop=4     " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set splitright    " Puts new vsplit windows to the right of the current
set splitbelow    " Puts new split windows to the bottom of the current
set autoread      " Automatically read a file changed outside of vim
set autowrite     " Automatically write a file when leaving a modified buffer
syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types
set mouse=a                    " Automatically enable mouse usage
set mousehide                  " Hide the mouse cursor while typing
set hidden                     " Allow buffer switching without saving
set t_Co=256                   " Use 256 colors
set ruler                      " Show the ruler
set showcmd                    " Show partial commands in status line and Selected characters/lines in visual mode
set showmode                   " Display current mode
set linespace=0                " No extra spaces between rows
set backspace=indent,eol,start " Backspace for dummies

set winminheight=0
set wildmode=list:longest,full
set wildmenu

set history=10000

if exists('g:vim_better_default_minimum') && g:vim_better_default_minimum
  finish
endif

set background=dark        " Assume dark background
set cursorline             " Highlight current line

set ffs=unix,dos,mac       " Use Unix as the standard file type

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

highlight clear SignColumn
highlight clear LineNr

set number         " Line numbers on
set relativenumber " Relative numbers on
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set laststatus=2   " Always show status line
set linebreak
set foldenable
set foldmarker={,}
set foldlevel=0
set foldmethod=marker
set foldcolumn=3

set wildignore+=*swp,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe  " Windows

if has('clipboard')
    set clipboard=unnamed
endif

set viminfo+=!
if has('persistent_undo')
  set undofile             " Persistent undo
  set undolevels=1000      " Maximum number of changes that can be undone
  set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
endif

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

  if !exists('g:vim_better_default_key_mapping') ||
        \ g:vim_better_default_key_mapping
    " Basic {
      if !exists('g:vim_better_default_basic_key_mapping') ||
            \ g:vim_better_default_basic_key_mapping
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
        " Move to the start of line
        nnoremap H ^
        " Move to the end of line
        nnoremap L $
        " Yank to the end of line
        nnoremap Y y$
        " Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv
        " Auto indent pasted text
        nnoremap p p=`]<C-o>
        " Treat long lines ad break lines (useful when moving around in them)
        map j gj
        map k gk

        nmap <Leader>sc :nohlsearch<CR>
      endif
    " }

    " Window {
      if !exists('g:vim_better_default_window_key_mapping') ||
            \ g:vim_better_default_window_key_mapping
        nnoremap <Leader>ww <C-W>w
        nnoremap <Leader>wr <C-W>r
        nnoremap <Leader>wd <C-W>c
        nnoremap <Leader>wq <C-W>q
        nnoremap <Leader>wj <C-W>j
        nnoremap <Leader>wk <C-W>k
        nnoremap <Leader>wh <C-W>h
        nnoremap <Leader>wl <C-W>l
        nnoremap <Leader>w= <C-W>=
        nnoremap <Leader>ws <C-W>s
        nnoremap <Leader>w- <C-W>s
        nnoremap <Leader>wv <C-W>v
        nnoremap <Leader>w\| <C-W>v
        nnoremap <Leader>w2 <C-W>v
      endif
    " }

    " Buffer {
      if !exists('g:vim_better_default_buffer_key_mapping') ||
            \ g:vim_better_default_buffer_key_mapping
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

    " Fold {
      if !exists('g:vim_better_default_fold_key_mapping') ||
            \ g:vim_better_default_fold_key_mapping
        nnoremap <Leader>f0 :set foldlevel=0<CR>
        nnoremap <Leader>f1 :set foldlevel=1<CR>
        nnoremap <Leader>f2 :set foldlevel=2<CR>
        nnoremap <Leader>f3 :set foldlevel=3<CR>
        nnoremap <Leader>f4 :set foldlevel=4<CR>
        nnoremap <Leader>f5 :set foldlevel=5<CR>
        nnoremap <Leader>f6 :set foldlevel=6<CR>
        nnoremap <Leader>f7 :set foldlevel=7<CR>
        nnoremap <Leader>f8 :set foldlevel=8<CR>
        nnoremap <Leader>f9 :set foldlevel=9<CR>
      endif
    " }

  endif
" }
