if executable('metals-vim')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'metals',
      \ 'cmd': {server_info->['metals-vim']},
      \ 'initialization_options': { 'rootPatterns': 'build.sbt' },
      \ 'whitelist': [ 'scala', 'sbt' ],
      \ })
endif
