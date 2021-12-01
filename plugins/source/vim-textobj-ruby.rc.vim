
let s:save_cpo = &cpo
set cpo&vim

call textobj#user#plugin('ruby', {
    \ 'method' : {
    \      'select-a' : 'ard', '*select-a-function*' : 'textobj#ruby#method_select_a',
    \      'select-i' : 'ird', '*select-i-function*' : 'textobj#ruby#method_select_i',
    \   },
    \
    \ 'module_class' : {
    \      'select-a' : 'arc', '*select-a-function*' : 'textobj#ruby#module_class_select_a',
    \      'select-i' : 'irc', '*select-i-function*' : 'textobj#ruby#module_class_select_i',
    \   },
    \ 'do' : {
    \      'select-a' : 'arb', '*select-a-function*' : 'textobj#ruby#do_block_select_a',
    \      'select-i' : 'irb', '*select-i-function*' : 'textobj#ruby#do_block_select_i',
    \   }
    \ })

" 折りたたみ
nmap <nowait> zird virdzf
nmap <nowait> zirc virczf

let &cpo = s:save_cpo
unlet s:save_cpo
