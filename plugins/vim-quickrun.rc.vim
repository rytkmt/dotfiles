let g:quickrun_config= {
  \   '_': {
  \     'runner': 'vimproc',
  \     'runner/vimproc/updatetime' : 60,
  \     'outputter/error/success' : 'buffer',
  \     'outputter/error/error'   : 'quickfix',
  \     'outputter/buffer/split': ':botright 8sp',
  \     'hook/time/enable': '1'
  \    },
  \   'ruby/syntax_check': {
  \     "command" : "ruby",
  \     "exec"    : "%c %s:p %o",
  \     "cmdopt"  : "-c",
  \     "vimproc/sleep"    : 0
  \   }
  \ }
nnoremap [quick]r :<C-u>QuickRun
nnoremap [quick]a :<C-u>QuickRun -args
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
