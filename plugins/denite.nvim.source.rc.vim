hi link deniteSource_file_rec Normal
hi link deniteSource_file_mru Normal

call denite#custom#option('default', {
 \ "split": "floating",
 \ "wincol": float2nr(&columns / 8),
 \ "winrow": float2nr(&lines / 10),
 \ "winheight": float2nr(&lines / 10 * 8),
 \ 'highlight_filter_background': 'DeniteFilter',
 \ 'prompt': '$ ',
 \ 'expand': v:true,
 \ 'start_filter': v:false,
 \ 'filter-updatetime': 10,
 \ 'highlight_matched_char': 'Todo',
 \ 'highlight_matched_range': 'Normal',
 \ })
"  \ 'max_dynamic_update_candidates': 80000
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
 \ [ '.git/', 'tags', '.svn/', '.rbenv/' ])

call denite#custom#source('buffer', 'matchers',
 \ ['matcher/fuzzy', 'matcher/project_files'])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
 \ ['git', 'ls-files', '-co', '--exclude-standard'])
