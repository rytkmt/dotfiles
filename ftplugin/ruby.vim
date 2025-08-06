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

if !exists("*s:open_factory_file")
  function! s:open_factory_file()
    let l:path = FilePathUnderRoot()

    let parts = matchlist(l:path, '^app\/models\/cm_core\/\([^\/]*.rb\)')
    if !empty(parts)
      let l:factory_path = "spec/factories/" . parts[1]
      exe "vs ".l:factory_path
    end
  endfunction
  command! OpenFactoryFile call s:open_factory_file()
end

nnoremap [ft]f :<C-u>OpenFactoryFile<CR>
