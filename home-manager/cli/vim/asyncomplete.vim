" asyncomplete
set completeopt=menu,menuone,popup,noselect,noinsert

" keys
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-y>   pumvisible() ? asyncomplete#close_popup() : "\<cr>"
