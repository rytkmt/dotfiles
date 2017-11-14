let g:quickrun_config= {
  \   '_': {
  \     'runner': 'vimproc',
  \     'runner/vimproc/updatetime' : 60,
  \     'outputter/error/success' : 'buffer',
  \     'outputter/error/error'   : 'quickfix',
  \     'outputter/buffer/split': ':botright 8sp',
  \     'hook/time/enable': '1'
  \    },
  \   'ruby_syntax_check': {
  \     "command" : "ruby",
  \     "exec"    : "%c %o %s:p ",
  \     "cmdopt"  : "-c",
  \     "vimproc/sleep"    : 0,
  \     "outputter/buffer/into" : 1
  \   }
  \ }
if has('win32')
  let g:quickrun_config.ruby_syntax_check.command = 'C:\Ruby187\bin\ruby.EXE'
endif
nnoremap [quick]r :<C-u>QuickRun
vnoremap [map]r :QuickRun<CR>
nnoremap [quick]c :<C-u>QuickRun ruby_syntax_check<CR>
nnoremap [quick]a :<C-u>QuickRun -args
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
