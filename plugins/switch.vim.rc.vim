let g:switch_mapping = "-"
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['if', 'unless']),
  \   switch#NormalizedCase(['all', 'first']),
  \   switch#NormalizedCase(['left', 'right', 'center']),
  \   switch#NormalizedCase(['==', '!='])
  \ ]
