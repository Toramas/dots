set encoding=utf-8 fileencodings=
syntax on
set number
set ruler
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
set mouse=a
set autoindent
set colorcolumn=80
set showcmd
imap [ []<Left>
imap ( ()<Left>
imap { {}<Left>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://git.x4m3.rocks/x4m3/vim-epitech'
Plug 'terryma/vim-multiple-cursors'
Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal

" Lightline
set laststatus=2
set noshowmode

let g:lightline = { 'colorscheme': '16color' }

hi Normal          ctermfg=252 ctermbg=none
