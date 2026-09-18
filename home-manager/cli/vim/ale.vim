" ALE
let g:ale_enabled = 1

" ALE for SQL and Nix.
augroup ale_selected_filetypes
    autocmd!
    autocmd FileType * let b:ale_enabled =
        \ index(['sql', 'nix'], &filetype) >= 0

    " Only enable ALE keys on supported file types
    autocmd FileType sql,nix nmap <buffer> <leader>ad <plug>(ale_detail)
    autocmd FileType sql,nix nmap <buffer> <leader>an <plug>(ale_next_wrap)
    autocmd FileType sql,nix nmap <buffer> <leader>aN <plug>(ale_previous_wrap)
    autocmd FileType sql,nix nmap <buffer> <leader>ah :ALEHover<CR>
augroup END

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 300
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1
let g:ale_sign_error = '??'
let g:ale_sign_warning = '>>'

let g:ale_linters = {
\   'nix': ['statix'],
\}

let g:ale_fixers = {
\   'nix': ['nixfmt'],
\}
