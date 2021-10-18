" set nospell

" Setting for start checking min length of character. (default 4)
" let g:spelunker_target_min_char_len = 4

" Setting for max suggest words list length. (default 15)
" let g:spelunker_max_suggest_words = 15

" Setting for max highlight words each buffers. (default 100)
" let g:spelunker_max_hi_words_each_buf = 100

" Override highlight group name of wrong spell words. (default 'SpelunkerSpellBad')
" let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default 'SpelunkerComplexOrCompoundWord')
" let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
" highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#e0d9af

" highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

let g:spelunker_white_list_for_user = [
 \ "klass", "kana",
 \ "nekopos", "conveni", "regexp"
 \ ]
