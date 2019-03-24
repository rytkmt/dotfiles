let g:switch_mapping = "-"
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['left', 'right', 'center']),
  \   switch#NormalizedCase(['==', '!=']),
  \   switch#NormalizedCase(['ON', 'OFF']),
  \   switch#NormalizedCase(['post', 'get', 'put', 'delete'])
  \ ]

autocmd FileType ruby let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['if', 'unless']),
  \   switch#NormalizedCase(['all', 'first'])
  \ ]

autocmd FileType neosnippet let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['head', 'word'])
  \ ]
