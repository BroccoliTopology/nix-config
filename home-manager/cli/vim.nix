{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # Common
      vim-sensible
      fzf-vim

      # Looks
      dracula-vim
      papercolor-theme
      vim-airline
      vim-airline-themes
      vim-startify

      # Coding
      ale
      vim-vsnip
      vim-vsnip-integ

      # Utilities
      vim-better-whitespace
      vim-commentary
      vim-surround

      # Languages
      python-syntax
      vim-toml
      rust-vim
    ];
    extraConfig = ''
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

      " Start screen
      let g:startify_session_autoload = 0
      let g:startify_files_number = 10
      let g:startify_lists = []
      let g:startify_custom_header = [ '    Hi~! >_<' ]

      " Help menu on the right
      autocmd FileType help wincmd L

      " Looks
      set background=dark
      colorscheme dracula
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#buffer_nr_show = 1

      " Keybinds
      let mapleader = " "

      " Keybinds - Startify
      nnoremap <leader>ss :Startify<CR>

      " Keybinds - FZF
      nnoremap <leader>ff :Files<CR>
      nnoremap <leader>fb :Buffers<CR>
      nnoremap <leader>fg :GFiles<CR>
      nnoremap <leader>fr :Rg<CR>

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

      " Strip whitespace on save
      autocmd BufWritePre * :StripWhitespace

      " Python
      let g:python_highlight_all = 1

      autocmd FileType python setlocal textwidth=100
      autocmd FileType python setlocal colorcolumn=88,100

      " ALE
      let g:ale_enabled = 1
      let g:ale_completion_enabled = 1

      set completeopt=menu,menuone,popup,noselect,noinsert

      let g:ale_fix_on_save = 1
      let g:ale_set_balloons = 1

      let g:ale_linters = {
      \   'python': ['ruff', 'ty'],
      \}

      let g:ale_fixers = {
      \   'python': ['ruff', 'ruff_format'],
      \}

      let g:ale_python_ruff_executable = 'ruff'
      let g:ale_python_ty_executable = 'ty'

      let g:ale_sign_error = '??'
      let g:ale_sign_warning = '>>'

      nmap <leader>ad <plug>(ale_detail)
      nmap <leader>an <plug>(ale_next_wrap)
      nmap <leader>aN <plug>(ale_previous_wrap)
      nmap <leader>ah :alehover<cr>

      " vsnip
      let g:vsnip_snippet_dir = expand('~/.vim/snippets/')

      imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
      smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'

      imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
      smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

      imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
      smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
      imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
      smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

      nmap s <Plug>(vsnip-select-text)
      xmap s <Plug>(vsnip-select-text)
      nmap S <Plug>(vsnip-cut-text)
      xmap S <Plug>(vsnip-cut-text)
    '';
  };
}
