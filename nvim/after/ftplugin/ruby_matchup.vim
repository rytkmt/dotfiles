" midを省く
call matchup#util#patch_match_words("\\<\\%(else\\|elsif\\|ensure\\|when\\|rescue\\|break\\|redo\\|next\\|retry\\|return\\)\\>", "")
" treesitterのhighlightをvimのfunctionで取得できないと加工できない・・
"
" 下: 元のmatchupのコピー（コピーして加工する）
" let b:matchup_skip = 'synIDattr(synID(line(''.''),col(''.''),0),''name'') =~ ''\<ruby\%(String\|.+Delimiter\|Character\|.+Escape\|Regexp\|Interpolation\|Comment\|Documentation\|ConditionalModifier\|RepeatModifier\|RescueModifier\|OptionalDo\|MethodName\|BlockArgument\|KeywordAsMethod\|ClassVariable\|InstanceVariable\|GlobalVariable\|Symbol\)\>'''
