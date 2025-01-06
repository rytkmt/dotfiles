 let g:quickrun_config= {
  \   '_': {
  \     'runner': 'neovim_job',
  \     'runner/vimproc/updatetime' : 60,
  \     'outputter/error/success' : 'buffer',
  \     'outputter/error/error'   : 'quickfix',
  \     'outputter/buffer/split': ':botright 8sp',
  \     'hook/time/enable': '1'
  \    },
  \   'swift': {
  \     'command': 'xcrun',
  \     'cmdopt': 'swift',
  \     'exec': '%c %o %s',
  \   },
  \   'bundle_ruby': {
  \     "vimproc/sleep"    : 0,
  \     "outputter/buffer/into" : 1
  \   }
  \ }

function! s:bundle_ruby(...)
  if !exists("g:my_quickrun_config")
    let g:my_quickrun_config = {}
  endif

  if exists("a:1")
    let g:my_quickrun_config["rails_root"] = a:1
  elseif !has_key(g:my_quickrun_config, "rails_root")
    echom "require rails_root path"
    return
  endif

  let g:quickrun_config["bundle_ruby"]["exec"] = "env BUNDLE_GEMFILE=". g:my_quickrun_config["rails_root"]. "/Gemfile bundle exec ruby %o %s:p "
  exe "QuickRun bundle_ruby"
endfunction
command! -nargs=? QuickRunBundle call s:bundle_ruby(<f-args>)

nnoremap [quick]r :<C-u>QuickRun
nnoremap [quick]b :<C-u>QuickRunBundle
vnoremap [map]r :QuickRun<CR>
nnoremap [quick]a :<C-u>QuickRun -args
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
