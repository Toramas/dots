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

call plug#end()

" Color scheme
colorscheme monokai

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
