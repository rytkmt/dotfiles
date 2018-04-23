let g:scratch_insert_autohide = 0
let g:scratch_persistence_file = '~/.vim/cache/scratch/scratch.vim'
autocmd MyAutoCmd FileType scratch nnoremap <buffer> q :q<CR>
