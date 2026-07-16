 let g:quickrun_config= {
  \   '_': {
  \     'runner': 'neovim_job',
  \     'runner/vimproc/updatetime' : 60,
  \     'outputter/error/success' : 'buffer',
  \     'outputter/error/error'   : 'quickfix',
  \     'outputter/buffer/split': ':botright 8sp',
  \     'hook/time/enable': '1'
  \    },
  \   'bundle_ruby': {
  \     "vimproc/sleep"    : 0,
  \     "outputter/buffer/into" : 1
  \   }
  \ }

nnoremap [quick]r :<C-u>QuickRun
vnoremap [map]r :QuickRun<CR>
nnoremap [quick]a :<C-u>QuickRun -args
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
