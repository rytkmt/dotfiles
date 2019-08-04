let g:switch_mapping = "-"
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['left', 'right', 'center']),
  \   switch#NormalizedCase(['before', 'after']),
  \   switch#NormalizedCase(['start', 'end']),
  \   switch#NormalizedCase(['==', '!=']),
  \   switch#NormalizedCase(['ON', 'OFF']),
  \   switch#NormalizedCase(['post', 'get', 'put', 'delete']),
  \   switch#NormalizedCase(['asc', 'desc']),
  \   switch#NormalizedCase(['する', 'しない']),
  \   switch#NormalizedCase(['はい', 'いいえ']),
  \   switch#NormalizedCase(['正常', '異常']),
  \   switch#NormalizedCase(['成功', '失敗']),
  \   switch#NormalizedCase(['無い', '有る']),
  \   switch#NormalizedCase(['以上', '以下']),
  \   switch#NormalizedCase(['-', '+'])
  \ ]

autocmd FileType ruby let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['if', 'unless']),
  \   switch#NormalizedCase(['once', 'all']),
  \   switch#NormalizedCase(['all', 'first']),
  \   switch#NormalizedCase(['describe', 'context'])
  \ ]

autocmd FileType neosnippet let b:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['head', 'word'])
  \ ]
