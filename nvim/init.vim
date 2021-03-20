" ~/.config/nvim/int.vim

" == General Configuration ==

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets
set ignorecase              " case insensitive matching
set mouse=a                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white spaces
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the previous one
set smartindent             " add or remove an indent on the line depending of the previous one
set number                  " add line numbers
set cc=80                   " set a 80 column border for good coding style (because I'm not some kind of monster)
set cursorline              " highlight the current line
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
imap [ []<Left>
imap ( ()<Left>
imap { {}<Left>

" == Integrated terminal config ==

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" == Keyboard shortcuts mapping ==

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" == Plugins ==

" managed by vim-plug
call plug#begin("~/.local/share/nvim/plugged")

    " Theme
    Plug 'arcticicestudio/nord-vim'

    " File searching
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Auto-completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Lightline status bar
    Plug 'itchyny/lightline.vim'

    " Git diff markers

    Plug 'airblade/vim-gitgutter'

    " File explorer w/ icons
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'  " Load vim-devicons last

call plug#end()

" == Colors ==

if (has("termguicolors"))
    set termguicolors
endif

" Nord colorscheme config
let g:nord_cursor_line_number_background = 1    " highlight the current line number
let g:nord_uniform_diff_background = 1          " make the background uniform in vim-diff mode (text is colored instead)
let g:nord_italic = 1                           " activate italic font
let g:nord_italic_comments = 1                  " makes comment in italic

colorscheme nord            " colorscheme from plugin

" == Lightline config ==

set noshowmode      " Hide mode information from based neovim
let g:lightline = { 'colorscheme': 'nord' }

" == NERDTree config ==

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" == Fuzzy finder config ==

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" == Conquer of completion config ==

let g:coc_global_extensions = ['coc-clangd', 'coc-docker', 'coc-rome', 'coc-css', 'coc-pyright', 'coc-rls']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
