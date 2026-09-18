" Base configs that I don't normally touch
syntax on
set nocompatible
set laststatus=2
set hidden
set number
set rnu
set nowrap
set linebreak
set autoindent
set tabstop=2
set shiftwidth=4
set expandtab
set hlsearch
set smartcase
set shm+=I

" Help menu on the right
autocmd FileType help wincmd L

" Keybinds - Base
let mapleader = " "

" Keybinds - Buffer Management
nnoremap <silent> <leader>bh :bprevious<CR>
nnoremap <silent> <leader>bl :bnext<CR>
nnoremap <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bn :enew<CR>

" Keybinds - Window Management
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wd :close<CR>
nnoremap <silent> <leader>wn :vsplit<CR>
nnoremap <silent> <leader>wN :ssplit<CR>
