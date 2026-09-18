" vim-lsp

" Diagnostic signs
let g:lsp_diagnostics_signs_error       = {'text': '✘'}
let g:lsp_diagnostics_signs_warning     = {'text': '▲'}
let g:lsp_diagnostics_signs_information = {'text': '●'}
let g:lsp_diagnostics_signs_hint        = {'text': '◆'}

" Inline diagnostics
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_align = 'right'
let g:lsp_diagnostics_virtual_text_wrap = 'truncate'
let g:lsp_diagnostics_virtual_text_tidy = 1

" LSP buffer setup
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    " Diagnostic navigation
    nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
    nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]e <Plug>(lsp-next-error)
    nmap <buffer> [e <Plug>(lsp-previous-error)

    " Diagnostic details / hover
    nmap <buffer> K <Plug>(lsp-hover)

    " Navigation
    nmap <buffer> gd <Plug>(lsp-definition)
    nmap <buffer> gr <Plug>(lsp-references)

    " Refactor
    nmap <buffer> <leader>rn <Plug>(lsp-rename)

    " Open / refresh diagnostics panel manually
    nnoremap <buffer> <leader>ld
        \ :LspDocumentDiagnostics<CR>
        \ :wincmd L<CR>
        \ :vertical resize 60<CR>
endfunction

augroup lsp_setup
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Let long messages wrap in diagnostic/quickfix windows
augroup diagnostic_panel
    autocmd!
    autocmd FileType qf setlocal wrap linebreak
augroup END
