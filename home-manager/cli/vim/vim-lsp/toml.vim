if executable('taplo')
  augroup lsp_register_taplo
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'taplo',
          \ 'cmd': {server_info->['taplo', 'lsp', 'stdio']},
          \ 'allowlist': ['toml'],
          \ 'workspace_config': {},
          \ })
  augroup END
endif
