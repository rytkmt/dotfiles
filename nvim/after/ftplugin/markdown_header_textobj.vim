"" Markdown header text object
" * inner object is the text between prev section header(excluded) and the next
"   section of the same level(excluded) or end of file.
" * an object is the text between prev section header(included) and the next section of the same
"   level(excluded) or end of file.
func! s:header_textobj(inner) abort
    let lnum_start = search('^#\+\s\+[^[:space:]=]', "ncbW")
    if lnum_start
        let lvlheader = matchstr(getline(lnum_start), '^#\+')
        let lnum_end = search('^#\{1,'..len(lvlheader)..'}\s', "nW")
        if !lnum_end
            let lnum_end = search('\%$', 'cnW')
        else
            let lnum_end -= 1
        endif
        if a:inner && getline(lnum_start + 1) !~ '^#\+\s\+[^[:space:]=]'
            let lnum_start += 1
        endif
        while lnum_end > 0
          if empty(trim(getline(lnum_end)))
            let lnum_end -= 1
          else
            break
          endif
        endwhile

        exe lnum_end
        normal! V
        exe lnum_start
    endif
endfunc


onoremap <buffer><silent> ih :<C-u>call <sid>header_textobj(v:true)<CR>
onoremap <buffer><silent> ah :<C-u>call <sid>header_textobj(v:false)<CR>
xnoremap <buffer><silent> ih :<C-u>call <sid>header_textobj(v:true)<CR>
xnoremap <buffer><silent> ah :<C-u>call <sid>header_textobj(v:false)<CR>
nmap <buffer><silent> zfh vahzf
