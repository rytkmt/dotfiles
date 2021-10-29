nmap <nowait> - <Plug>(Switch)

autocmd FileType ruby let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['if', 'unless']),
  \   switch#NormalizedCase(['describe', 'context', 'example']),
  \   switch#NormalizedCase(['class', 'module']),
  \   switch#NormalizedCase(['require', 'require_relative']),
  \ ]

autocmd FileType neosnippet let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['head', 'word'])
  \ ]
