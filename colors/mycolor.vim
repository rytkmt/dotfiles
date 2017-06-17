" mycolor color scheme

let g:colors_name = "rytkmt"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

" GUI & hexadecimal palettes"{{{
if (has("gui_running"))
    let s:vmode       = "gui"
    let s:col1       = "#2b2b2b"
    let s:col2       = "#353535"
    let s:col3       = "#444444"
    let s:col4       = "#AFAFAF"
    let s:col5       = "#DFDFDF"
    let s:col6        = "#AF8B5F"
    let s:col7      = "#DFDF5F"
    let s:col8      = "#DF8B5F"
    let s:col9        = "#B2DC93"
    let s:col10       = "#87AF5F"
    let s:col11       = "#9377B2"
    let s:col12  = "#93B2DC"
    let s:col13   = "#5F87AF"
    let s:col14   = "#ECB2B2"
    let s:col15         = "#CF5F5F"
    let s:col16       = "#FFE0C0"
" 上書き"
    let s:col1       = "#232323"
    let s:col2       = "#484848"
    let s:col3       = "#464646"
    let s:col4       = "#B9B9B9"
    let s:col5       = "#D8D8D8"
    let s:col6        = "#94846a"
    let s:col7      = "#ffea00"
    let s:col8      = "#c38743"
    let s:col9        = "#769164"
    let s:col10       = "#475950"
    let s:col11       = "#9079ad"
    let s:col12  = "#abced8"
    let s:col13   = "#507ea4"
    let s:col14   = "#d4acad"
    let s:col15         = "#ec6d71"
    let s:col16       = "#ebe1a9"
" 上書き"
    let s:col1       = "#1c1b19" "黒
    let s:col2       = "#323232"
    " let s:col3       = "#464646"
    " let s:col4       = "#B9B9B9"
    let s:col5       = "#ede4dd" "白
    let s:col6        = "#769164"
    let s:col7      = "#e04053" "ピンク
    let s:col8      = "#cd9152" "ベージュ
    let s:col9        = "#817870" "グレー
    let s:col10       = "#9377B2" "紫
    let s:col11       = "#98bc37" "緑
    let s:col12  = "#abcee8" "水色
    let s:col13   = "#6583b3" "青
    let s:col14   = "#f4acad" "薄ピンク
    let s:col15         = "#d75f00" "オレンジ
    let s:col16       = "#ffc24b" "黄色

else
    let s:vmode       = "cterm"
    let s:col1       = "0"
    let s:col2       = "8"
    let s:col3       = "14"
    let s:col4       = "15"
    let s:col5       = "7"
    let s:col6        = "11"
    let s:col7      = "3"
    let s:col8      = "5"
    let s:col9        = "2"
    let s:col10       = "10"
    let s:col11       = "6"
    let s:col12  = "4"
    let s:col13   = "12"
    let s:col14   = "1"
    let s:col15         = "9"
    let s:col16       = "13"
endif
" }}}
" Highlighting primitives"{{{
exe "let s:bg_col1       = ' ".s:vmode."bg=".s:col1      ."'"
exe "let s:bg_col2       = ' ".s:vmode."bg=".s:col2      ."'"
exe "let s:bg_col3       = ' ".s:vmode."bg=".s:col3      ."'"
exe "let s:bg_col4       = ' ".s:vmode."bg=".s:col4      ."'"
exe "let s:bg_col5       = ' ".s:vmode."bg=".s:col5      ."'"
exe "let s:bg_col6        = ' ".s:vmode."bg=".s:col6       ."'"
exe "let s:bg_col7      = ' ".s:vmode."bg=".s:col7     ."'"
exe "let s:bg_col8      = ' ".s:vmode."bg=".s:col8     ."'"
exe "let s:bg_col9        = ' ".s:vmode."bg=".s:col9       ."'"
exe "let s:bg_col10       = ' ".s:vmode."bg=".s:col10      ."'"
exe "let s:bg_col11       = ' ".s:vmode."bg=".s:col11      ."'"
exe "let s:bg_col12  = ' ".s:vmode."bg=".s:col12 ."'"
exe "let s:bg_col13   = ' ".s:vmode."bg=".s:col13  ."'"
exe "let s:bg_col14   = ' ".s:vmode."bg=".s:col14  ."'"
exe "let s:bg_col15         = ' ".s:vmode."bg=".s:col15        ."'"
exe "let s:bg_col16       = ' ".s:vmode."bg=".s:col16      ."'"

exe "let s:fg_col1       = ' ".s:vmode."fg=".s:col1      ."'"
exe "let s:fg_col2       = ' ".s:vmode."fg=".s:col2      ."'"
exe "let s:fg_col3       = ' ".s:vmode."fg=".s:col3      ."'"
exe "let s:fg_col4       = ' ".s:vmode."fg=".s:col4      ."'"
exe "let s:fg_col5       = ' ".s:vmode."fg=".s:col5      ."'"
exe "let s:fg_col6        = ' ".s:vmode."fg=".s:col6       ."'"
exe "let s:fg_col7      = ' ".s:vmode."fg=".s:col7     ."'"
exe "let s:fg_col8      = ' ".s:vmode."fg=".s:col8     ."'"
exe "let s:fg_col9        = ' ".s:vmode."fg=".s:col9       ."'"
exe "let s:fg_col10       = ' ".s:vmode."fg=".s:col10      ."'"
exe "let s:fg_col11       = ' ".s:vmode."fg=".s:col11      ."'"
exe "let s:fg_col12  = ' ".s:vmode."fg=".s:col12 ."'"
exe "let s:fg_col13   = ' ".s:vmode."fg=".s:col13  ."'"
exe "let s:fg_col14   = ' ".s:vmode."fg=".s:col14  ."'"
exe "let s:fg_col15         = ' ".s:vmode."fg=".s:col15        ."'"
exe "let s:fg_col16       = ' ".s:vmode."fg=".s:col16      ."'"

exe "let s:sp_col1       = ' ".s:vmode."sp=".s:col1      ."'"
exe "let s:sp_col2       = ' ".s:vmode."sp=".s:col2      ."'"
exe "let s:sp_col3       = ' ".s:vmode."sp=".s:col3      ."'"
exe "let s:sp_col4       = ' ".s:vmode."sp=".s:col4      ."'"
exe "let s:sp_col5       = ' ".s:vmode."sp=".s:col5      ."'"
exe "let s:sp_col6        = ' ".s:vmode."sp=".s:col6       ."'"
exe "let s:sp_col7      = ' ".s:vmode."sp=".s:col7     ."'"
exe "let s:sp_col8      = ' ".s:vmode."sp=".s:col8     ."'"
exe "let s:sp_col9        = ' ".s:vmode."sp=".s:col9       ."'"
exe "let s:sp_col10       = ' ".s:vmode."sp=".s:col10      ."'"
exe "let s:sp_col11       = ' ".s:vmode."sp=".s:col11      ."'"
exe "let s:sp_col12  = ' ".s:vmode."sp=".s:col12 ."'"
exe "let s:sp_col13   = ' ".s:vmode."sp=".s:col13  ."'"
exe "let s:sp_col14   = ' ".s:vmode."sp=".s:col14  ."'"
exe "let s:sp_col15         = ' ".s:vmode."sp=".s:col15        ."'"
exe "let s:sp_col16       = ' ".s:vmode."sp=".s:col16      ."'"

exe "let s:underline      = ' ".s:vmode."=underline'"
exe "let s:bold      = ' ".s:vmode."=bold'"
"}}}

exe "hi! Normal"                 .s:fg_col5       .s:bg_col1
exe "hi! Comment"                .s:fg_col9

exe "hi! Constant"               .s:fg_col7
exe "hi! String"                 .s:fg_col16
exe "hi! Character"              .s:fg_col10

exe "hi! Identifier"             .s:fg_col13 "gui=NONE, cterm=NONE"
exe "hi! Function"               .s:fg_col10

exe "hi! Statement"              .s:fg_col15 "gui=NONE, cterm=NONE"
hi! link Label String
hi! link Exception PreProc

exe "hi! PreProc"                .s:fg_col14
hi! link Define Type
exe "hi! Macro"                  .s:fg_col16

exe "hi! Type"                   .s:fg_col8 "gui=NONE, cterm=NONE"
hi! link StorageClass Identifier

exe "hi! Special"                .s:fg_col12
exe "hi! SpecialChar"            .s:fg_col10
exe "hi! Tag"                    .s:fg_col8
exe "hi! Delimiter"              .s:fg_col4
exe "hi! SpecialComment"         .s:fg_col4
hi! link Debug Macro

exe "hi! Error"                  .s:fg_col5       .s:bg_col15
exe "hi! Todo"                   .s:fg_col7      .s:bg_col1

exe "hi! Cursor"                                   .s:bg_col4
exe "hi! CursorLine"                               .s:bg_col3  " cterm=NONE"
hi! link CursorColumn CursorLine
exe "hi! ColorColumn"                              .s:bg_col3
exe "hi! LineNr"                 .s:fg_col4
exe "hi! CursorLineNr"           .s:fg_col16      .s:bg_col2
exe "hi! NonText"                .s:fg_col12

exe "hi! Folded"                 .s:fg_col4       .s:bg_col1

exe "hi! PMenu"                  .s:fg_col6       .s:bg_col2
exe "hi! PMenuSel"               .s:fg_col10       .s:bg_col3
exe "hi! PMenuSBar"                                .s:bg_col3
exe "hi! PMenuThumb"                               .s:bg_col5

exe "hi! Visual"                                   .s:bg_col13
exe "hi! Search"                 .s:fg_col5       .s:bg_col13
hi! link IncSearch Search

exe "hi! VertSplit"              .s:fg_col1       .s:bg_col4
exe "hi! MatchParen"             .s:fg_col14   .s:bg_col1      "gui=underline, cterm=underline"
exe "hi! Title"                  .s:fg_col7
exe "hi! Directory"              .s:fg_col9
exe "hi! SpecialKey"             .s:fg_col3

exe "hi! SpellBad"               .s:fg_col14   .s:bg_col1      "gui=underline, cterm=underline"

exe "hi! FoldColumn"             .s:fg_col5       .s:bg_col3
exe "hi! SignColumn"             .s:fg_col5       .s:bg_col3

exe "hi! Underlined"             .s:fg_col12
exe "hi! Question"               .s:fg_col9
exe "hi! WarningMsg"             .s:fg_col14
exe "hi! ErrorMsg"               .s:fg_col1       .s:bg_col14


"全角スペースをハイライト表示
function! ZenkakuSpace()
    exe "hi! ZenkakuSpace" .s:bg_col15
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


"【_String】"
exe "hi! _String" .s:fg_col16
"【_Comment】"
exe "hi! _Comment" .s:fg_col9
"【_Regexp】"
exe "hi! _Regexp" .s:fg_col16
"【_Unknown】"
exe "hi! _Unknown" .s:bg_col7
"【_Value】
exe "hi! _Value" .s:fg_col11

" Diff {{{
exe "hi! DiffAdd"                .s:fg_col10       .s:bg_col1      "gui=underline, cterm=underline"
exe "hi! DiffDelete"             .s:fg_col14   .s:bg_col1
exe "hi! DiffChange"             .s:fg_col8      .s:bg_col1      "gui=underline, cterm=underline"
exe "hi! DiffText"               .s:fg_col8      .s:bg_col1      "gui=underline, cterm=underline"
" }}}

" Syntastic {{{
exe "hi! SyntasticErrorSign"      .s:fg_col14  .s:bg_col1
exe "hi! SyntasticStyleErrorSign" .s:fg_col14  .s:bg_col1
" }}}

" ruby {{{

" --------- col5 --------------"
" #{ here } <-- here"
exe "hi! rubyInterpolation" .s:fg_col5
" 3.times do |here| <-- here "
exe "hi! rubyBlockParameter" .s:fg_col5
" def here(name) <-- here "
exe "hi! rubyFunction" .s:fg_col5
" def method(some) <-- (some) \s "
exe "hi! rubyMethodBlock" .s:fg_col5
" class Class <-- \s = "
exe "hi! rubyBlock" .s:fg_col5
" some =   some >  "
exe "hi! rubyDoBlock" .s:fg_col5
" { nm => '', val => ''} {|nm| here } <-- , \s here"
exe "hi! rubyCurlyBlock" .s:fg_col5
" begin some_all end <-- some_all "
exe "hi! rubyBlockExpression" .s:fg_col5
" case here when 1 end <-- here \s "
exe "hi! rubyCaseExpression" .s:fg_col5
" [ 1, 2, 3] <-- , "
exe "hi! rubyArrayLiteral" .s:fg_col5
" if here else here end <-- here \s "
exe "hi! rubyConditionalExpression" .s:fg_col5
" for here in here do <-- here \s "
exe "hi! rubyOptionalDoLine" .s:fg_col5
" while true here end <-- here \s "
exe "hi! rubyRepeatExpression" .s:fg_col5
" eval(some) <-- eval"
exe "hi! rubyEval" .s:fg_col5
" raise "
exe "hi! rubyException" .s:fg_col5

" 3.times do |some, some2| <-- | , |"
exe "hi! rubyBlockParameterList" .s:fg_col5
" [ 1, 2, 3] <-- [ ] "
exe "hi! rubyArrayDelimiter" .s:fg_col5
" some = { name => '' , val => '' } <-- { } "
exe "hi! rubyCurlyBlockDelimiter" .s:fg_col5
" Class.method <-- . "
exe "hi! rubyMethodDeclaration" .s:fg_col5
" -------- col16 ----------"
" :some "
exe "hi! rubySymbol" .s:fg_col16
" ---------- col15 --------------"
" =========== fg =============="
" if end case when rescue
exe "hi! rubyConditional" .s:fg_col15 .s:bold
" do end begin rescue return"
exe "hi! rubyControl" .s:fg_col15 .s:bold
" exception_rescue"
exe "hi! rubyExceptional" .s:fg_col15 .s:bold
" yield "
exe "hi! rubyKeyword" .s:fg_col15 .s:bold
" while end for end "
exe "hi! rubyRepeat" .s:fg_col15 .s:bold
" for nm,val in some do <-- do "
exe "hi! rubyOptionalDo" .s:fg_col15 .s:bold
" some = 0 if true <-- if "
exe "hi! rubyConditionalModifier" .s:fg_col15 .s:bold
" begin some end until true <-- until "
exe "hi! rubyRepeatModifier" .s:fg_col15 .s:bold
" -------- col13 -----------"

" Person  Exception "
exe "hi! rubyConstant" .s:fg_col13
" self __FILE__ "
exe "hi! rubyPseudoVariable" .s:fg_col13
" ARGV "
exe "hi! rubyPredefinedConstant" .s:fg_col13
" #{ }"
exe "hi! rubyInterpolationDelimiter" .s:fg_col13
" -------- col12 ----------"
" @test"
exe "hi! rubyInstanceVariable" .s:fg_col12
" @@test"
exe "hi! rubyClassVariable" .s:fg_col12
" $test"
exe "hi! rubyGlobalVariable" .s:fg_col12
" $1
exe "hi! rubyPredefinedVariable" .s:fg_col12
" / some / "
exe "hi! rubyRegexpDelimiter" .s:fg_col12

" ---------- col9 --------------"
"【_Comment】"
" comment_TODO
hi! link rubyTodo _Comment
" /(?#here)/ <-- here"
hi! link rubyRegexpComment _Comment
" # some "
hi! link rubyComment _Comment
" =begin some =end <-- all "
hi! link rubyDocumentation _Comment

" ---------- col7 ------------"
" def end "
exe "hi! rubyDefine" .s:fg_col7 .s:bold
" method_exception_resque
exe "hi! rubyMethodExceptional" .s:fg_col7 .s:bold
" class end "
exe "hi! rubyClass" .s:fg_col7 .s:bold
" module end "
exe "hi! rubyModule" .s:fg_col7 .s:bold
" module_function :some <-- module_function "
exe "hi! rubyAccess" .s:fg_col7 .s:bold
" attr "
exe "hi! rubyAttribute" .s:fg_col7 .s:bold


" ---------- col16 ------------"

"【_String】"
" " " "
hi! link rubyStringDelimiter _String
" "string"
hi! link rubyString _String
" \s \\ \r\n"
hi! link rubyStringEscape _String

"【_Regexp】"
" / ( )  (?: )  (?<some> )  (?= )  (?<= )  (?# ) /"
hi! link rubyRegexpSpecial _Regexp
" / [[:some]]  \d \w \d [ ] /"
hi! link rubyRegexpCharClass _Regexp
" / \. \/ \$ /"
hi! link rubyRegexpEscape _Regexp
" / *  +  {1,5}  +?  *? /"
hi! link rubyRegexpQuantifier _Regexp
" / ^  \A  \z  /"
hi! link rubyRegexpAnchor _Regexp
" /  .  /"
hi! link rubyRegexpDot _Regexp
" / some_all /"
hi! link rubyRegexp _Regexp

" ----------- col8 -----------"

" extend require "
exe "hi! rubyInclude" .s:fg_col8

" ----------- col11 -----------"
" 3 "
hi! link rubyInteger _Value
" 1.0 "
hi! link rubyFloat _Value
" true false "
hi! link rubyBoolean _Value
" ---------- ??? --------------"
"【_Unknown】"
hi! link rubyQuoteEscape _Unknown
hi! link rubyInvalidVariable _Unknown
hi! link rubyNoInterpolation _Unknown
hi! link rubyDecol9scape _Unknown
hi! link rubyNestedParentheses _Unknown
hi! link rubyNestedCurlyBraces _Unknown
hi! link rubyNestedAngleBrackets _Unknown
hi! link rubyNestedSquareBrackets _Unknown
hi! link rubyRegexpParens _Unknown
hi! link rubyRegexpBrackets _Unknown
hi! link rubyASCIICode _Unknown
hi! link rubyLocalVariableOrMethod _Unknown
hi! link rubyBlockArgument _Unknown
hi! link rubySymbolDelimiter _Unknown
hi! link rubyHeredocStart _Unknown
hi! link rubyHeredoc _Unknown
hi! link rubyAliasDeclaration2 _Unknown
hi! link rubyAliasDeclaration _Unknown
hi! link rubyOperator _Unknown
hi! link rubyClassDeclaration _Unknown
hi! link rubyModuleDeclaration _Unknown
hi! link rubyBeginEnd _Unknown
hi! link rubySharpBang _Unknown
hi! link rubySpaceError _Unknown
hi! link rubyMultilineComment _Unknown
hi! link rubyKeywordAsMethod _Unknown
hi! link rubyDataDirective _Unknown
hi! link rubyData _Unknown
hi! link rubyIdentifier _Unknown
hi! link rubyPredefinedIdentifier _Unknown
hi! link rubyError _Unknown
" }}}

" css {{{
"------------- col5 -------------"
" selector{ } <-- { }"
exe "hi! cssBraces" .s:fg_col5
" #ff0000 red <-- ff0000 red "
exe "hi! cssColor" .s:fg_col5
" rect(0px auto, auto auto) <-- \s auto"
exe "hi! cssFunction" .s:fg_col5
" propety: some <-- \s % "
exe "hi! cssAttrRegion" .s:fg_col5
" none "
exe "hi! cssCommonAttr" .s:fg_col5
" propety: some; <-- : ;"
exe "hi! cssNoise" .s:fg_col5
" url(some) <-- url( )"
exe "hi! cssFunctionName" .s:fg_col5
" scale(x,y) <-- , "
exe "hi! cssFunctionComma" .s:fg_col5
" linear-gradient(left, #fff, rgba(255,0,0,0) <-- left "
exe "hi! cssGradientAttr" .s:fg_col5
" background: #fff url(some) top center no-repeat <-- top center no-repeat; "
exe "hi! cssBackgroundAttr" .s:fg_col5
" border:solid 1px #fff; <-- solid "
exe "hi! cssBorderAttr" .s:fg_col5
" margin: auto; overflow: hidden "
exe "hi! cssBoxAttr" .s:fg_col5
" font-family: Arial <-- Arial "
exe "hi! cssFontAttr" .s:fg_col5
" #FF0000 10px 2em 3Hz <-- # px em Hz"
exe "hi! cssUnitDecorators" .s:fg_col5
" @media (orientation: landscape){} <-- landscape"
exe "hi! cssMediaAttr" .s:fg_col5
" @media screen, print <-- , "
exe "hi! cssMediaComma" .s:fg_col5
" @media screen and (max-width:480px) <-- \s : ( ) "
exe "hi! cssInclude" .s:fg_col5
" break-after:column; <-- column "
exe "hi! cssMultiColumnAttr" .s:fg_col5
" animation-iteration-count: infinite; <-- infinite "
exe "hi! cssAnimationAttr" .s:fg_col5
" list-style: square url('../images/ico32.gif') inside <-- insize squeare"
exe "hi! cssListAttr" .s:fg_col5
" display:block; position:absolute; float:left <-- block absolute left "
exe "hi! cssPositioningAttr" .s:fg_col5
" page-break-inside: avoid; size:landscape; <-- avoid landscape "
exe "hi! cssPrintAttr" .s:fg_col5
" page-break-before: always; <-- always "
exe "hi! cssTableAttr" .s:fg_col5
" frex-wrap:nowrap; word-break:break-all; text-decoration:underline <-- nowrap break-all underline "
exe "hi! cssTextAttr" .s:fg_col5
" transition : width 1s ease-out; transition:1s linear <-- ease-out linear "
exe "hi! cssTransitionAttr" .s:fg_col5
" content:some; zoom:1; cursor:pointer; <-- content zoom pointer "
exe "hi! cssUIAttr" .s:fg_col5
" interpolation-mode:bicubic <-- bicubic "
exe "hi! cssIEUIAttr" .s:fg_col5
" voice-family:male; <-- male"
exe "hi! cssAuralAttr" .s:fg_col5
" , "
exe "hi! cssAttrComma" .s:fg_col5
" #aaa + .bbb > .test <-- + >  "
exe "hi! cssSelectorOp" .s:fg_col5
" input[type=radio] <-- = "
exe "hi! cssSelectorOp2" .s:fg_col5
" @media screen and (min-width:480px) <-- and "
exe "hi! cssMediaKeyword" .s:fg_col5

"【_CSS_Value】"
"z-index:2; line-height:1; <-- 2 1 (IntegerはNumberでもあるのでNumberが優先される
hi! link cssValueInteger _CSS_Value
"z-index:2; transform:scale(1,2.3) <-- 2 1 2.3 "
hi! link cssValueNumber _CSS_Value
" padding:20px; font-size:14em; <-- 20 14 "
hi! link cssValueLength _CSS_Value
" transform:rotateX(360deg); <-- 360 "
hi! link cssValueAngle _CSS_Value
" transition: 0.2s linear; <-- 0.2 "
hi! link cssValueTime _CSS_Value
" 14Hz 3kHz <-- 14 3 "
hi! link cssValueFrequency _CSS_Value

"------------- col15 ---------------"
" !important "
exe "hi! cssImportant" .s:fg_col15 .s:bold
"----------- col14 -----------"
"------------ col8 -------------"
" div ul "
exe "hi! cssTagName" .s:fg_col8
" @keyframes some { 0% {} 30%{} } <-- 0% 30% "
exe "hi! cssKeyFrameSelector" .s:fg_col8
"------------ col7 -------------"
"------------ col16 --------------"
"【_String】"
" content: "\2193"; <-- \2193
hi! link cssUnicodeEscape _String
" 'some' "
hi! link cssStringQ _String
" "some" "
hi! link cssStringQQ _String
" "\\\\" "
hi! link cssSpecialCharQQ _String
" '\\\\' "
hi! link cssSpecialCharQ _String
"------------- col9 --------------"
"【_Comment】】"
hi! link cssComment _Comment
"------------ col10 --------------"
" @charset "
exe "hi! cssIncludeKeyword" .s:fg_col10
" @font-face "
exe "hi! cssFontDescriptor" .s:fg_col10
" .class <-- . "
exe "hi! cssClassNameDot" .s:fg_col10
" .class <-- class "
exe "hi! cssClassName" .s:fg_col10
" #id "
exe "hi! cssIdentifier" .s:fg_col10
" .top_margin{} <-- _ "
exe "hi! cssHacks" .s:fg_col10
"---------- col12 -----------"
" selector:pseudo-class{} <-- pseudo-class "
exe "hi! cssPseudoClass" .s:fg_col12
" @page:first <-- :first "
exe "hi! cssPagePseudo" .s:fg_col12
" input:checked div:hover <-- :checked :hover "
exe "hi! cssPseudoClassId" .s:fg_col12
"---------- col13 ------------"

"【_CSS_Property】"
exe "hi! _CSS_Property" .s:fg_col13
" -moz- -webkit- "
hi! link cssVendor _CSS_Property
" animation-name animation-duration "
hi! link cssAnimationProp _CSS_Property
" content "
hi! link cssPageProp _CSS_Property
" background background-color "
hi! link cssBackgroundProp _CSS_Property
" border border-color "
hi! link cssBorderProp _CSS_Property
" margin padding margin-right "
hi! link cssBoxProp _CSS_Property
" opacity "
hi! link cssColorProp _CSS_Property
" width height "
hi! link cssDimensionProp _CSS_Property
" font-size font-family "
hi! link cssFontProp _CSS_Property
" page-break-before: always <-- page-break-before "
hi! link cssMultiColumnProp _CSS_Property
" font-family: myFont; src:url(some); <-- font-family src "
hi! link cssFontDescriptorProp _CSS_Property
" counter-increment: popular_img; "
hi! link cssGeneratedContentProp _CSS_Property
" target-new:none; <-- target_new "
hi! link cssHyerlinkProp _CSS_Property
" list-style-type:none; <-- list-style-type "
hi! link cssListProp _CSS_Property
" display: float: left: top: position: <-- :以外"
hi! link cssPositioningProp _CSS_Property
" table-layout:auto; <-- table-layout"
hi! link cssTableProp _CSS_Property
" line-height:2; color:red; <-- line-height color "
hi! link cssTextProp _CSS_Property
" transform: scale(1.5); <-- transform "
hi! link cssTransformProp _CSS_Property
" transition: some; transition-property:some <-- transition transition-property "
hi! link cssTransitionProp _CSS_Property
" box-sizing: some; cursor: some; <-- box-sizing cursor "
hi! link cssUIProp _CSS_Property
" zoom: some; interpolation-mode: some; filter: some <-- zoom inter@olation-mode filter "
hi! link cssIEUIProp _CSS_Property
" pitch: some; <-- pitch "
hi! link cssAuralProp _CSS_Property
" text-size-adjust: some; <-- text-size-adjust "
hi! link cssMobileTextProp _CSS_Property
" box-shadow: some <-- box-shadow "
hi! link cssFlexibleBoxProp _CSS_Property
" @media screen{ min-color: some} <-- min-color "
hi! link cssMediaProp _CSS_Property

"------------ col11 --------------"
" url(img/arw.png) <-- img/arw.png "
exe "hi! cssURL" .s:fg_col11
" url(sansation_light.woff) <-- sansation_light.woff "
exe "hi! cssFontDescriptorFunction" .s:fg_col11
" unicode-range: U+000-5FF, U+1e00-1fff, U+2000-2300;"
exe "hi! cssFontDescriptorAttr" .s:fg_col11
" content: open-quote <-- open quote "
exe "hi! cssGeneratedContentAttr" .s:fg_col11

" input[type=radio] <-- type radio "
exe "hi! cssAttributeSelector" .s:fg_col11
" :lang(en) :lang(no) <-- en no "
exe "hi! cssPseudoClassFn" .s:fg_col11
" @media screen and print <-- screen print all "
exe "hi! cssMediaType" .s:fg_col11
"------------ ??? ----------------"
"【_Unknown】"
hi! link cssMediaBlock _Unknown
hi! link cssError _Unknown
" hi! link cssDefinition _Unknown
hi! link cssPageWrap _Unknown
hi! link cssPage _Unknown
hi! link cssPageMargin _Unknown
hi! link cssKeyFrameWrap _Unknown
hi! link cssKeyFrame _Unknown
hi! link cssFontDescriptorBlock _Unknown
hi! link cssFlexibleBoxAttr _Unknown
hi! link cssGridProp _Unknown
hi! link cssBraceError _Unknown
hi! link cssDeprecated _Unknown
hi! link cssProp _Unknown
hi! link cssContentForPagedMediaProp _Unknown
hi! link cssMarqueeProp _Unknown
hi! link cssPagedMediaProp _Unknown
hi! link cssRubyProp _Unknown
hi! link cssSpeechProp _Unknown
hi! link cssRenderProp _Unknown
hi! link cssAttr _Unknown
hi! link cssContentForPagedMediaAttr _Unknown
hi! link cssDimensionAttr _Unknown
hi! link cssGridAttr    _Unknown
hi! link cssHyerlinkAttr _Unknown
hi! link cssLineboxAttr _Unknown
hi! link cssMarginAttr  _Unknown
hi! link cssMarqueeAttr _Unknown
hi! link cssPaddingAttr _Unknown
hi! link cssPagedMediaAttr _Unknown
hi! link cssRubyAttr    _Unknown
hi! link cssSpeechAttr  _Unknown
hi! link cssTransformAttr _Unknown
hi! link cssRenderAttr  _Unknown
hi! link cssPseudoClassLang _Unknown
"}}}


" javascript {{{
" -------------- col5 -------------------- "
" { } "dd
exe "hi! javaScriptBraces" .s:fg_col5

" alert() confirm() <-- alert confirm "
exe "hi! javaScriptMessage" .s:fg_col5
" window "
exe "hi! javaScriptGlobal" .s:fg_col5
" document "
exe "hi! javaScriptMember" .s:fg_col5
" if() function() <-- ( ) "
exe "hi! javaScriptParens" .s:fg_col5
" ------------- col14 ----------------- "
" new "
exe "hi! javaScriptOperator" .s:fg_col14
" return "
exe "hi! javaScriptStatement" s:fg_col14
" break "
exe "hi! javaScriptBranch" .s:fg_col14
" var "
exe "hi! javaScriptIdentifier" .s:fg_col14
" --------------- col15 --------------------- "
" function(){} <-- function "
exe "hi! javaScriptFunction" .s:fg_col15 .s:bold
" if else end "
exe "hi! javaScriptConditional" .s:fg_col15 .s:bold
" for "
exe "hi! javaScriptRepeat" .s:fg_col15 .s:bold
" case "
exe "hi! javaScriptLabel" .s:fg_col15 .s:bold
" --------------- col9 -------------------- "
"【_Comment】"
" //some "
hi! link javaScriptLineComment _Comment
" /* some */ "
hi! link javaScriptComment _Comment
" -------------- col16 -------------------- "
"【_String】"
" /,/g "
hi! link javaScriptRegexpString _String
" "some" "
hi! link javaScriptStringD _String
" 'some' "
hi! link javaScriptStringS _String
" ------------- col13 ----------------- "
" Date "
exe "hi! javaScriptType" .s:fg_col13
" -------------- col11 -------------------- "
" 1 3 "
hi! link javaScriptValue _Value
" 1 3 "
hi! link javaScriptNumber _Value
" true false "
hi! link javaScriptBoolean _Value
" null "
hi! link javaScriptNull _Value
" -------------- ??? ---------------------- "
hi! link javaScriptRailsFunction _Unknown
hi! link javaScriptTemplateVar _Unknown
hi! link javaScriptTemplateDelim _Unknown
hi! link javaScriptTemplateString _Unknown
hi! link javaScriptCommentTodo _Unknown
hi! link javaScriptCommentSkip _Unknown
hi! link javaScriptSpecial _Unknown
hi! link javaScriptSpecialCharacter _Unknown
hi! link javaScriptException _Unknown
hi! link javaScriptDeprecated _Unknown
hi! link javaScriptReserved _Unknown
hi! link javaScriptCharacter _Unknown
hi! link javaScriptError _Unknown
hi! link javaScrParenError _Unknown
hi! link javaScriptDebug _Unknown
hi! link javaScriptConstant _Unknown
" }}}

" html {{{
" -------------- col5 --------------
" class="" name="" id="" <-- class name id
exe "hi! htmlArg" .s:fg_col5
" onclick="method(aa,bb)" <-- onclick="method ,
exe "hi! htmlEvent" .s:fg_col5
" <a href="aaa">here</a> <-- here
exe "hi! htmlLink" .s:fg_col5

exe "hi! javaScript" .s:fg_col5
" ------------- col15 -----------------
" <tag> </tag> <-- tag
exe "hi! htmlTagName" .s:fg_col15
" <script> </script> <-- script
exe "hi! htmlSpecialTagName" .s:fg_col15
" ------------- col9 ----------------
" 【_Comment】
" <!-- comment --> <-- -- comment --
hi! link htmlCommentPart _Comment
" <!-- comment --> <-- <! >
hi! link htmlComment _Comment
hi! link htmlCssStyleComment _Comment
" ------------- col13 -----------
exe "hi! htmlSpecialChar" .s:fg_col13

" <tag> <div id=""> <-- < > \s =
exe "hi! htmlTag" .s:fg_col13
" </tag> <-- </ >
exe "hi! htmlEndTag" .s:fg_col13
" <script> <-- < >
exe "hi! htmlScriptTag" .s:fg_col13
" -------------- col16 --------------
" "aa" 'aa'
hi! link htmlString _String
" -------------- col11 --------------
" colspan=2 <-- 2
hi! link htmlValue _Value
" -------------- Error --------------
"  
hi! link htmlError Error
hi! link htmlTagError Error
hi! link htmlCommentError Error
" ------------- Unknown -------------
hi! link javaScriptExpression _Unknown
hi! link htmlTagN _Unknown
hi! link htmlCssDefinition _Unknown
hi! link htmlPreStmt _Unknown
hi! link htmlPreError _Unknown
hi! link htmlPreAttr _Unknown
hi! link htmlPreProc _Unknown
hi! link htmlPreProcAttrError _Unknown
hi! link htmlPreProcAttrName _Unknown
hi! link htmlBoldUnderline _Unknown
hi! link htmlBoldItalic _Unknown
hi! link htmlBold _Unknown
hi! link htmlBoldUnderlineItalic _Unknown
hi! link htmlBoldItalicUnderline _Unknown
hi! link htmlUnderlineBold _Unknown
hi! link htmlUnderlineItalic _Unknown
hi! link htmlUnderline _Unknown
hi! link htmlUnderlineBoldItalic _Unknown
hi! link htmlUnderlineItalicBold _Unknown
hi! link htmlItalicBold _Unknown
hi! link htmlItalicUnderline _Unknown
hi! link htmlItalic _Unknown
hi! link htmlItalicBoldUnderline _Unknown
hi! link htmlItalicUnderlineBold _Unknown
hi! link htmlHead _Unknown
hi! link htmlEventSQ _Unknown
hi! link htmlEventDQ _Unknown
" ------------- Normal ----------------
hi! link htmlLeadingSpace Normal
hi! link htmlH1 Normal
hi! link htmlH2 Normal
hi! link htmlH3 Normal
hi! link htmlH4 Normal
hi! link htmlH5 Normal
hi! link htmlH6 Normal
hi! link htmlTitle Normal
hi! link cssStyle Normal

"}}}
"
"
" yaml {{{
"yamlKey        xxx cleared
"yamlAnchor     xxx cleared
"yamlAlias      xxx cleared
"yamlDocumentHeader xxx cleared

"}}}

" julia {{{
hi! link juliaAssignOperator Statement
hi! link juliaTypeOperator Statement
hi! link juliaRangeOperator Statement
hi! link juliaVarargOperator Statement
hi! link juliaRangeEnd Number
hi! link juliaKeyword PreProc
hi! link juliaParDelim Delimiter
exe "hi! juliaStringVarsPla"     .s:fg_col9
exe "hi! juliaStringVarDelim"    .s:fg_col9
exe "hi! juliaStringVarsPar"     .s:fg_col9
" }}}

" NERDTree {{{
exe "hi! NERDTreeCWD"            .s:fg_col14
exe "hi! NERDTreeDirSlash"       .s:fg_col7
exe "hi! NERDTreeHelp"           .s:fg_col6
exe "hi! NERDTreeHelpTitle"      .s:fg_col7
exe "hi! NERDTreeHelpKey"        .s:fg_col11
" }}}

" tex {{{
hi! link TexMathDelim Macro
exe "hi! TexMathOper"            .s:fg_col12
exe "hi! TexCite"                .s:fg_col9
" }}}

" sh {{{
hi! link shQuote String
" }}}

" markdown {{{
hi! link markdownUrl String
" }}}

" vimfiler {{{
exe "hi! vimfilerLeaf"  .s:fg_col13
exe "hi! vimfilerNonMark"  .s:fg_col4
" exe "hi! vimfilerMark"  .s:fg_col11
" exe "hi! vimfilerCurrentDirectory"  .s:fg_col11
" exe "hi! vimfilerStatus"  .s:fg_col11
" exe "hi! vimfilerDirectory"  .s:fg_col11
exe "hi! vimfilerNormalFile"  .s:fg_col5
exe "hi! vimfilerMarkedFile"  .s:fg_col16
exe "hi! vimfilerOpenedFile"  .s:fg_col15
exe "hi! vimfilerClosedFile"  .s:fg_col6
exe "hi! vimfilerROFile"  .s:fg_col9
" }}}
