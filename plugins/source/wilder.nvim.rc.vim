" call wilder#set_option('renderer', wilder#wildmenu_renderer({
"       \ 'highlighter': wilder#basic_highlighter(),
"       \ }))
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'min_width': '20%',
      \ 'highlights': {
      \   'border': 'Normal',
      \   'default': wilder#make_hl('WilderDefault', 'Normal', [{}, {}, {}]),
      \   'selected': wilder#make_hl('WilderSelected', [{}, {}, {'foreground': '#f4e746', 'underline': 1}]),
      \   'selected_accent': wilder#make_hl('WilderSelectedAccent', 'WilderSelected', [{}, {}, {}]),
      \   'accent': wilder#make_hl('WilderAccent', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'border': 'rounded',
 \ })))
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'debounce': 15,
      \     }),
      \   ),
      \ ])
call wilder#setup({'modes': [':']})
