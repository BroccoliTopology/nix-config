if executable('ty')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ty',
        \ 'cmd': {server_info->['ty', 'server']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('ruff')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff',
        \ 'cmd': {server_info->['ruff', 'server']},
        \ 'allowlist': ['python'],
        \ })
endif
