augroup vimproc-async-receive-test
augroup END


" コマンド終了時に呼ばれる関数
function! s:receive_vimproc_result(callback, ...)
    if !has_key(s:, "vimproc")
        return
    endif
    let vimproc = s:vimproc
    try
        if !vimproc.stdout.eof
            let s:vimproc_result .= vimproc.stdout.read()
        endif
        if !vimproc.stderr.eof
            let s:vimproc_result .= vimproc.stderr.read()
        endif
        if !(vimproc.stdout.eof && vimproc.stderr.eof)
            return 0
        endif
    catch
        echom v:throwpoint
    endtry

    let a:arg_str = ''
    let a:args = []
    call add(a:args, 's:vimproc_result')
    if len(a:000) > 0
      for var in a:000
        call add(a:args, var)
      endfor
    endif
    let a:arg_str = "(" . join(a:args, ', "') . '")'
    " 終了時に呼ぶ
    exe "call " . a:callback . a:arg_str

    augroup vimproc-async-receive-test
      autocmd!
    augroup END

    call vimproc.stdout.close()
    call vimproc.stderr.close()
    call vimproc.waitpid()
    unlet s:vimproc
    unlet s:vimproc_result
endfunction

function! s:system_async(cmd, callback, ...)
    let cmd = a:cmd
    echom "----async----"
    echom cmd
    let vimproc = vimproc#pgroup_open(cmd)
    call vimproc.stdin.close()

    let s:vimproc = vimproc
    let s:vimproc_result = ""

    let a:arg_str = ''
    let a:args = []
    call add(a:args, a:callback)
    if len(a:000) > 0
      for var in a:000
        call add(a:args, var)
      endfor
    endif
    let a:arg_str = join(a:args, '", "')
echom "---arg_str---"
echom a:arg_str
    augroup vimproc-async-receive-test
        execute "autocmd! CursorHold,CursorHoldI * call"
\               "s:receive_vimproc_result(\"" . a:arg_str . "\")"
    augroup END
endfunction

" function Test()
"   call s:system_async('pwd', 'Test2', '/Applications/MacVim.app/Contents')
" endfunction
"
" function Test2(result, dir)
"   echom a:result
"   echom a:dir
