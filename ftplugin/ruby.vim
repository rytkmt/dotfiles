setl iskeyword+=?,!
let g:no_ruby_maps = 1

if !exists("*s:open_spec_file")
  function! s:open_spec_file()
    let l:path = FilePathUnderRoot()
    let l:spec_path = substitute(substitute(l:path, "app/", "spec/", ""), ".rb", "_spec.rb", "")
    call mkdir(fnamemodify(l:spec_path, ':h'), "p")

    exe "vs ".l:spec_path
  endfunction
  command! OpenSpecFile call s:open_spec_file()
end

nnoremap [ft]s :<C-u>OpenSpecFile<CR>
