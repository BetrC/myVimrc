
" Vim Setup

" Startup {{{
filetype indent plugin on
" vim 文件折叠方式为 marker
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" General {{{
set nocompatible
set showcmd
set showmode
set nobackup
set noswapfile
set history=1024
set autochdir
set clipboard+=unnamed
set winaltkeys=no
set undofile
set autochdir
" error handler
set noerrorbells
set visualbell
set autoread
set wildmenu
set wildmode=longest:list,full
" }}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
" }}}

" GUI {{{
" colorscheme Tomorrow-Night
set laststatus=2
set cursorline
set hlsearch
set number
set linebreak
set splitbelow
set splitright
set lazyredraw  " redraw only when we need to

set t_Co=256
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
set guioptions-=e
set nolist
" set listchars=tab:▶\ ,eol:¬,trail:·,extends:>,precedes:<
set guifont=Inconsolata:h12:cANSI

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" forbid shink
set gcr=a:block-blinkon0

" }}}

" Format{{{
 set ts=4
 set tabstop=4
 set shiftwidth=4
 set ai!
 set expandtab
 " show line
 set nu!

 set nocompatible
 set autoindent
 set cindent
 set smartindent

 " ruler
 set ruler

 " match
 set showmatch
 set nohls
 set incsearch
 set backspace=2
 
 set incsearch
 set ignorecase
 set nocompatible
 set wildmenu
 set spell spelllang=en_us
 set listchars=tab:»■,trail:■
 set list
" }}}

" Key Map {{{
 nmap <Space>w :w<CR> 
 nmap <Space>s :wq<CR>
 nmap <Space>q :wq!<CR>

 " switch window
 nmap <Space>h <C-w>h
 nmap <Space>l <C-w>l
 nmap <Space>j <C-w>j
 nmap <Space>k <C-k>k

 nmap <F10> :TagbarToggle<CR>

 map <silent> <F11> :call ToggleFullScreen()<CR>

" }}}

" Funcs {{{

" full screen
fun! ToggleFullscreen()
    call system("wmctrl -ir" .v:windowid . " -b toggle, fullscreen")
endf


" }}}

" Plugin vundle {{{
 filetype off
 set rtp+=~/.vim/bundle/Vundle.vim
 
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'powerline/powerline' 
 Plugin 'vim-scripts/luainspect.vim'
 Plugin 'xolox/vim-misc'
 Plugin 'xolox/vim-lua-ftplugin'
 Plugin 'majutsushi/tagbar'
 Plugin 'scrooloose/nerdtree'
 call vundle#end()
 filetype plugin indent on
" }}}

" Auto Cmd{{{
    autocmd VimEnter * call ToggleFullscreen()

    " nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" }}}

" Ctags{{{
let g:tagbar_type_lua = {
    \ 'ctagstype':'lua',
    \ 'kind':[
        \ 'm:modules:0:0',
        \ 'f:function:0:1',
        \ 'v:locals:0:0'
    \ ],
    \ 'sort':0
\ }
" }}}
