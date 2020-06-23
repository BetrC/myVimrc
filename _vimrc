" Vim Setup
" Startup {{{
set ffs=mac,unix
let uname = substitute(system('uname'), '\n', '', '')
" Example values: Linux, Darwin, MINGW64_NT-10.0, MINGW32_NT-6.1
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
set undodir=~/.undodir
set autochdir
" error handler
set noerrorbells
set visualbell
set autoread
set copyindent
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

setlocal foldlevel=1
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" forbid shink
set gcr=a:block-blinkon0

"guicursor
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]20;CursorShape=0\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=0\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set list
set listchars=tab:>>,trail:.
" }}}

" Font {{{
 " font for multiple system
 if has('win32')
     set guifont=Cascadia_Code:h11,Monaco_for_Powerline:h11,Microsoft_YaHei_UI:h11,Courier_New:h11,monospace:h11:cANSI
 elseif has('macunix')
     set guifont=Cascadia\ Code:h15,Monaco\ for\ Powerline:h15,Courier_New:h15,monospace:h15
Menlo\ Regular:h15
 elseif has('unix')
     set guifont=Cascadia\ Code\ 13,Monaco\ for\ Powerline\ 13,Courier_New\ 13,monospace\ 13
 endif
" }}}

" Format {{{
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
"show space with .
set list
set listchars=tab:>>,trail:.
" }}}

" Key Map {{{
 nmap <Space>w :w<CR>
 nmap <Space>s :wq<CR>
 nmap <Space>q :wq!<CR>
 if has('win32') || has('win64')
     nmap <Space>rc :e ~/_vimrc<CR>
 else
     nmap <Space>rc :e ~/.vimrc<CR>
 end
 " switch window
 nmap <Space>h <C-w>h
 nmap <Space>l <C-w>l
 nmap <Space>j <C-w>j
 nmap <Space>k <C-k>k

 "switch in edit mode
 inoremap <C-j> <down>
 inoremap <C-k> <up>
 inoremap <C-l> <right>
 inoremap <C-H> <left>

 nmap <F10> :TagbarToggle<CR>

 map <silent> <F11> :call ToggleFullScreen()<CR>
 
 nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

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
 Plugin 'preservim/nerdtree'
 "Plugin 'Valloric/YouCompleteMe'
 Plugin 'liuchengxu/vim-which-key'
 Plugin 'godlygeek/tabular'
 Plugin 'plasticboy/vim-markdown'
 Plugin 'zxqfl/tabnine-vim'
 Plugin 'tpope/vim-surround'
 Plugin 'ctrlpvim/ctrlp.vim'
 Plugin 'dense-analysis/ale'
 Plugin 'RRethy/vim-illuminate'
 Plugin 'markonm/traces.vim'
 Plugin 'haya14busa/incsearch.vim'
 Plugin 'hanfezh/pretty-json'

 call vundle#end()
 filetype plugin indent on
" }}}

" Auto Cmd{{{
    autocmd VimEnter * call ToggleFullscreen()

    " nerdtree
    autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

"{{{ Ctrlp
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    if has('win32')
        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
        let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
    elseif has('unix')
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        let g:ctrlp_user_command = 'find %s -type f'
    endif
    
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"}}}

"Files{{{

au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\ exe "normal! g'\"" |
\ endif

"}}}
