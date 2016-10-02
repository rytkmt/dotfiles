" mycolor color scheme

let g:colors_name = "tropikos"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

" GUI & hexadecimal palettes"{{{
if (has("gui_running"))
    let s:vmode       = "gui"
    let s:base4       = "#2b2b2b"
    let s:base3       = "#353535"
    let s:base2       = "#444444"
    let s:base1       = "#AFAFAF"
    let s:base0       = "#DFDFDF"
    let s:gold        = "#AF8B5F"
    let s:yellow      = "#DFDF5F"
    let s:orange      = "#DF8B5F"
    let s:lime        = "#B2DC93"
    let s:green       = "#87AF5F"
    let s:lilac       = "#9377B2"
    let s:light_blue  = "#93B2DC"
    let s:dark_blue   = "#5F87AF"
    let s:light_red   = "#ECB2B2"
    let s:red         = "#CF5F5F"
    let s:beige       = "#FFE0C0"
" 上書き"
    let s:base4       = "#232323"
    let s:base3       = "#484848"
    let s:base2       = "#464646"
    let s:base1       = "#B9B9B9"
    let s:base0       = "#D8D8D8"
    let s:gold        = "#94846a"
    let s:yellow      = "#ffea00"
    let s:orange      = "#c38743"
    let s:lime        = "#769164"
    let s:green       = "#475950"
    let s:lilac       = "#9079ad"
    let s:light_blue  = "#abced8"
    let s:dark_blue   = "#507ea4"
    let s:light_red   = "#d4acad"
    let s:red         = "#ec6d71"
    let s:beige       = "#ebe1a9"
else
    let s:vmode       = "cterm"
    let s:base4       = "0"
    let s:base3       = "8"
    let s:base2       = "14"
    let s:base1       = "15"
    let s:base0       = "7"
    let s:gold        = "11"
    let s:yellow      = "3"
    let s:orange      = "5"
    let s:lime        = "2"
    let s:green       = "10"
    let s:lilac       = "6"
    let s:light_blue  = "4"
    let s:dark_blue   = "12"
    let s:light_red   = "1"
    let s:red         = "9"
    let s:beige       = "13"
endif
" }}}
" Highlighting primitives"{{{
exe "let s:bg_base4       = ' ".s:vmode."bg=".s:base4      ."'"
exe "let s:bg_base3       = ' ".s:vmode."bg=".s:base3      ."'"
exe "let s:bg_base2       = ' ".s:vmode."bg=".s:base2      ."'"
exe "let s:bg_base1       = ' ".s:vmode."bg=".s:base1      ."'"
exe "let s:bg_base0       = ' ".s:vmode."bg=".s:base0      ."'"
exe "let s:bg_gold        = ' ".s:vmode."bg=".s:gold       ."'"
exe "let s:bg_yellow      = ' ".s:vmode."bg=".s:yellow     ."'"
exe "let s:bg_orange      = ' ".s:vmode."bg=".s:orange     ."'"
exe "let s:bg_lime        = ' ".s:vmode."bg=".s:lime       ."'"
exe "let s:bg_green       = ' ".s:vmode."bg=".s:green      ."'"
exe "let s:bg_lilac       = ' ".s:vmode."bg=".s:lilac      ."'"
exe "let s:bg_light_blue  = ' ".s:vmode."bg=".s:light_blue ."'"
exe "let s:bg_dark_blue   = ' ".s:vmode."bg=".s:dark_blue  ."'"
exe "let s:bg_light_red   = ' ".s:vmode."bg=".s:light_red  ."'"
exe "let s:bg_red         = ' ".s:vmode."bg=".s:red        ."'"
exe "let s:bg_beige       = ' ".s:vmode."bg=".s:beige      ."'"

exe "let s:fg_base4       = ' ".s:vmode."fg=".s:base4      ."'"
exe "let s:fg_base3       = ' ".s:vmode."fg=".s:base3      ."'"
exe "let s:fg_base2       = ' ".s:vmode."fg=".s:base2      ."'"
exe "let s:fg_base1       = ' ".s:vmode."fg=".s:base1      ."'"
exe "let s:fg_base0       = ' ".s:vmode."fg=".s:base0      ."'"
exe "let s:fg_gold        = ' ".s:vmode."fg=".s:gold       ."'"
exe "let s:fg_yellow      = ' ".s:vmode."fg=".s:yellow     ."'"
exe "let s:fg_orange      = ' ".s:vmode."fg=".s:orange     ."'"
exe "let s:fg_lime        = ' ".s:vmode."fg=".s:lime       ."'"
exe "let s:fg_green       = ' ".s:vmode."fg=".s:green      ."'"
exe "let s:fg_lilac       = ' ".s:vmode."fg=".s:lilac      ."'"
exe "let s:fg_light_blue  = ' ".s:vmode."fg=".s:light_blue ."'"
exe "let s:fg_dark_blue   = ' ".s:vmode."fg=".s:dark_blue  ."'"
exe "let s:fg_light_red   = ' ".s:vmode."fg=".s:light_red  ."'"
exe "let s:fg_red         = ' ".s:vmode."fg=".s:red        ."'"
exe "let s:fg_beige       = ' ".s:vmode."fg=".s:beige      ."'"

exe "let s:sp_base4       = ' ".s:vmode."sp=".s:base4      ."'"
exe "let s:sp_base3       = ' ".s:vmode."sp=".s:base3      ."'"
exe "let s:sp_base2       = ' ".s:vmode."sp=".s:base2      ."'"
exe "let s:sp_base1       = ' ".s:vmode."sp=".s:base1      ."'"
exe "let s:sp_base0       = ' ".s:vmode."sp=".s:base0      ."'"
exe "let s:sp_gold        = ' ".s:vmode."sp=".s:gold       ."'"
exe "let s:sp_yellow      = ' ".s:vmode."sp=".s:yellow     ."'"
exe "let s:sp_orange      = ' ".s:vmode."sp=".s:orange     ."'"
exe "let s:sp_lime        = ' ".s:vmode."sp=".s:lime       ."'"
exe "let s:sp_green       = ' ".s:vmode."sp=".s:green      ."'"
exe "let s:sp_lilac       = ' ".s:vmode."sp=".s:lilac      ."'"
exe "let s:sp_light_blue  = ' ".s:vmode."sp=".s:light_blue ."'"
exe "let s:sp_dark_blue   = ' ".s:vmode."sp=".s:dark_blue  ."'"
exe "let s:sp_light_red   = ' ".s:vmode."sp=".s:light_red  ."'"
exe "let s:sp_red         = ' ".s:vmode."sp=".s:red        ."'"
exe "let s:sp_beige       = ' ".s:vmode."sp=".s:beige      ."'"

exe "let s:underline      = ' ".s:vmode."=underline'"
exe "let s:bold      = ' ".s:vmode."=bold'"
"}}}

exe "hi! Normal"                 .s:fg_base0       .s:bg_base4
exe "hi! Comment"                .s:fg_lime

exe "hi! Constant"               .s:fg_yellow
exe "hi! String"                 .s:fg_beige
exe "hi! Character"              .s:fg_green

exe "hi! Identifier"             .s:fg_dark_blue "gui=NONE, cterm=NONE"
exe "hi! Function"               .s:fg_light_red

exe "hi! Statement"              .s:fg_red "gui=NONE, cterm=NONE"
hi! link Label String
hi! link Exception PreProc

exe "hi! PreProc"                .s:fg_light_red
hi! link Define Type
exe "hi! Macro"                  .s:fg_beige

exe "hi! Type"                   .s:fg_orange "gui=NONE, cterm=NONE"
hi! link StorageClass Identifier

exe "hi! Special"                .s:fg_light_blue
exe "hi! SpecialChar"            .s:fg_green
exe "hi! Tag"                    .s:fg_orange
exe "hi! Delimiter"              .s:fg_base1
exe "hi! SpecialComment"         .s:fg_base1
hi! link Debug Macro

exe "hi! Error"                  .s:fg_base0       .s:bg_red
exe "hi! Todo"                   .s:fg_yellow      .s:bg_base4

exe "hi! Cursor"                                   .s:bg_base1
exe "hi! CursorLine"                               .s:bg_base3  " cterm=NONE"
hi! link CursorColumn CursorLine
exe "hi! ColorColumn"                              .s:bg_base2
exe "hi! LineNr"                 .s:fg_base1
exe "hi! CursorLineNr"           .s:fg_yellow      .s:bg_base3
exe "hi! NonText"                .s:fg_light_blue                       .s:bold

exe "hi! Folded"                 .s:fg_base1       .s:bg_base4

exe "hi! PMenu"                  .s:fg_base0       .s:bg_base3
exe "hi! PMenuSel"               .s:fg_base0       .s:bg_base2
exe "hi! PMenuSBar"                                .s:bg_base2
exe "hi! PMenuThumb"                               .s:bg_base0

exe "hi! Visual"                                   .s:bg_dark_blue
exe "hi! Search"                 .s:fg_base0       .s:bg_dark_blue
hi! link IncSearch Search

exe "hi! VertSplit"              .s:fg_base4       .s:bg_base1
exe "hi! MatchParen"             .s:fg_light_red   .s:bg_base4      "gui=underline, cterm=underline"
exe "hi! Title"                  .s:fg_yellow
exe "hi! Directory"              .s:fg_lime
exe "hi! SpecialKey"             .s:fg_base2

exe "hi! SpellBad"               .s:fg_light_red   .s:bg_base4      "gui=underline, cterm=underline"

exe "hi! FoldColumn"             .s:fg_base0       .s:bg_base2
exe "hi! SignColumn"             .s:fg_base0       .s:bg_base2

exe "hi! Underlined"             .s:fg_light_blue
exe "hi! Question"               .s:fg_lime
exe "hi! WarningMsg"             .s:fg_light_red
exe "hi! ErrorMsg"               .s:fg_base4       .s:bg_light_red


"全角スペースをハイライト表示
function! ZenkakuSpace()
    exe "hi! ZenkakuSpace" .s:bg_red
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
exe "hi! _String" .s:fg_beige
"【_Comment】"
exe "hi! _Comment" .s:fg_lime
"【_Regexp】"
exe "hi! _Regexp" .s:fg_beige
"【_Unknown】"
exe "hi! _Unknown" .s:bg_yellow
"【_Value】
exe "hi! _Value" .s:fg_lilac

" Diff {{{
exe "hi! DiffAdd"                .s:fg_green       .s:bg_base4      "gui=underline, cterm=underline"
exe "hi! DiffDelete"             .s:fg_light_red   .s:bg_base4
exe "hi! DiffChange"             .s:fg_orange      .s:bg_base4      "gui=underline, cterm=underline"
exe "hi! DiffText"               .s:fg_orange      .s:bg_base4      "gui=underline, cterm=underline"
" }}}

" Syntastic {{{
exe "hi! SyntasticErrorSign"      .s:fg_light_red  .s:bg_base4
exe "hi! SyntasticStyleErrorSign" .s:fg_light_red  .s:bg_base4
" }}}

" ruby {{{

" --------- base0 --------------"
" #{ here } <-- here"
exe "hi! rubyInterpolation" .s:fg_base0
" 3.times do |here| <-- here "
exe "hi! rubyBlockParameter" .s:fg_base0
" 3.times do |some, some2| <-- | , |"
exe "hi! rubyBlockParameterList" .s:fg_base0
" Class.method <-- . "
exe "hi! rubyMethodDeclaration" .s:fg_base0
" def here(name) <-- here "
exe "hi! rubyFunction" .s:fg_base0
" def method(some) <-- (some) \s "
exe "hi! rubyMethodBlock" .s:fg_base0
" class Class <-- \s = "
exe "hi! rubyBlock" .s:fg_base0
" some =   some >  "
exe "hi! rubyDoBlock" .s:fg_base0
" some = { name => '' , val => '' } <-- { } "
exe "hi! rubyCurlyBlockDelimiter" .s:fg_base0
" { nm => '', val => ''} {|nm| here } <-- , \s here"
exe "hi! rubyCurlyBlock" .s:fg_base0
" [ 1, 2, 3] <-- [ ] "
exe "hi! rubyArrayDelimiter" .s:fg_base0
" [ 1, 2, 3] <-- , "
exe "hi! rubyArrayLiteral" .s:fg_base0
" begin some_all end <-- some_all "
exe "hi! rubyBlockExpression" .s:fg_base0
" case here when 1 end <-- here \s "
exe "hi! rubyCaseExpression" .s:fg_base0
" if here else here end <-- here \s "
exe "hi! rubyConditionalExpression" .s:fg_base0
" for here in here do <-- here \s "
exe "hi! rubyOptionalDoLine" .s:fg_base0
" while true here end <-- here \s "
exe "hi! rubyRepeatExpression" .s:fg_base0
" eval(some) <-- eval"
exe "hi! rubyEval" .s:fg_base0
" raise "
exe "hi! rubyException" .s:fg_base0

" -------- light_red ----------"
" :some "
exe "hi! rubySymbol" .s:fg_beige
" ---------- red --------------"
" =========== fg =============="
" if end case when rescue
exe "hi! rubyConditional" .s:fg_red
" do end begin rescue return"
exe "hi! rubyControl" .s:fg_red
" exception_rescue"
exe "hi! rubyExceptional" .s:fg_red
" yield "
exe "hi! rubyKeyword" .s:fg_red
" while end for end "
exe "hi! rubyRepeat" .s:fg_red
" for nm,val in some do <-- do "
exe "hi! rubyOptionalDo" .s:fg_red
" some = 0 if true <-- if "
exe "hi! rubyConditionalModifier" .s:fg_red
" begin some end until true <-- until "
exe "hi! rubyRepeatModifier" .s:fg_red
" -------- dark_blue -----------"

" Person  Exception "
exe "hi! rubyConstant" .s:fg_dark_blue
" self __FILE__ "
exe "hi! rubyPseudoVariable" .s:fg_dark_blue
" ARGV "
exe "hi! rubyPredefinedConstant" .s:fg_dark_blue
" #{ }"
exe "hi! rubyInterpolationDelimiter" .s:fg_dark_blue
" -------- light_blue ----------"
" @test"
exe "hi! rubyInstanceVariable" .s:fg_light_blue
" @@test"
exe "hi! rubyClassVariable" .s:fg_light_blue
" $test"
exe "hi! rubyGlobalVariable" .s:fg_light_blue
" $1
exe "hi! rubyPredefinedVariable" .s:fg_light_blue
" / some / "
exe "hi! rubyRegexpDelimiter" .s:fg_light_blue

" ---------- lime --------------"
"【_Comment】"
" comment_TODO
hi! link rubyTodo _Comment
" /(?#here)/ <-- here"
hi! link rubyRegexpComment _Comment
" # some "
hi! link rubyComment _Comment
" =begin some =end <-- all "
hi! link rubyDocumentation _Comment

" ---------- green -------------"
" ---------- yellow ------------"
" def end "
exe "hi! rubyDefine" .s:fg_yellow
" method_exception_resque
exe "hi! rubyMethodExceptional" .s:fg_yellow
" class end "
exe "hi! rubyClass" .s:fg_yellow
" module end "
exe "hi! rubyModule" .s:fg_yellow
" module_function :some <-- module_function "
exe "hi! rubyAccess" .s:fg_yellow
" attr "
exe "hi! rubyAttribute" .s:fg_yellow


" ---------- beige ------------"

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

" ----------- orange -----------"

" extend require "
exe "hi! rubyInclude" .s:fg_orange

" ----------- lilac -----------"
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
hi! link rubyDelimEscape _Unknown
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
"------------- base0 -------------"
" selector{ } <-- { }"
exe "hi! cssBraces" .s:fg_base0
" #ff0000 red <-- ff0000 red "
exe "hi! cssColor" .s:fg_base0
" rect(0px auto, auto auto) <-- \s auto"
exe "hi! cssFunction" .s:fg_base0
" propety: some <-- \s % "
exe "hi! cssAttrRegion" .s:fg_base0
" none "
exe "hi! cssCommonAttr" .s:fg_base0
" propety: some; <-- : ;"
exe "hi! cssNoise" .s:fg_base0
" url(some) <-- url( )"
exe "hi! cssFunctionName" .s:fg_base0
" scale(x,y) <-- , "
exe "hi! cssFunctionComma" .s:fg_base0
" linear-gradient(left, #fff, rgba(255,0,0,0) <-- left "
exe "hi! cssGradientAttr" .s:fg_base0
" background: #fff url(some) top center no-repeat <-- top center no-repeat; "
exe "hi! cssBackgroundAttr" .s:fg_base0
" border:solid 1px #fff; <-- solid "
exe "hi! cssBorderAttr" .s:fg_base0
" margin: auto; overflow: hidden "
exe "hi! cssBoxAttr" .s:fg_base0
" font-family: Arial <-- Arial "
exe "hi! cssFontAttr" .s:fg_base0
" #FF0000 10px 2em 3Hz <-- # px em Hz"
exe "hi! cssUnitDecorators" .s:fg_base0
" @media (orientation: landscape){} <-- landscape"
exe "hi! cssMediaAttr" .s:fg_base0
" @media screen, print <-- , "
exe "hi! cssMediaComma" .s:fg_base0
" @media screen and (max-width:480px) <-- \s : ( ) "
exe "hi! cssInclude" .s:fg_base0
" break-after:column; <-- column "
exe "hi! cssMultiColumnAttr" .s:fg_base0
" animation-iteration-count: infinite; <-- infinite "
exe "hi! cssAnimationAttr" .s:fg_base0
" list-style: square url('../images/ico32.gif') inside <-- insize squeare"
exe "hi! cssListAttr" .s:fg_base0
" display:block; position:absolute; float:left <-- block absolute left "
exe "hi! cssPositioningAttr" .s:fg_base0
" page-break-inside: avoid; size:landscape; <-- avoid landscape "
exe "hi! cssPrintAttr" .s:fg_base0
" page-break-before: always; <-- always "
exe "hi! cssTableAttr" .s:fg_base0
" frex-wrap:nowrap; word-break:break-all; text-decoration:underline <-- nowrap break-all underline "
exe "hi! cssTextAttr" .s:fg_base0
" transition : width 1s ease-out; transition:1s linear <-- ease-out linear "
exe "hi! cssTransitionAttr" .s:fg_base0
" content:some; zoom:1; cursor:pointer; <-- content zoom pointer "
exe "hi! cssUIAttr" .s:fg_base0
" interpolation-mode:bicubic <-- bicubic "
exe "hi! cssIEUIAttr" .s:fg_base0
" voice-family:male; <-- male"
exe "hi! cssAuralAttr" .s:fg_base0
" , "
exe "hi! cssAttrComma" .s:fg_base0
" #aaa + .bbb > .test <-- + >  "
exe "hi! cssSelectorOp" .s:fg_base0
" input[type=radio] <-- = "
exe "hi! cssSelectorOp2" .s:fg_base0
" @media screen and (min-width:480px) <-- and "
exe "hi! cssMediaKeyword" .s:fg_base0

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

"------------- red ---------------"
" !important "
exe "hi! cssImportant" .s:fg_red
"----------- light_red -----------"
" .class <-- . "
exe "hi! cssClassNameDot" .s:fg_light_red
" .class <-- class "
exe "hi! cssClassName" .s:fg_light_red
" #id "
exe "hi! cssIdentifier" .s:fg_light_red
" .top_margin{} <-- _ "
exe "hi! cssHacks" .s:fg_light_red
"------------ orange -------------"
" div ul "
exe "hi! cssTagName" .s:fg_orange
" @keyframes some { 0% {} 30%{} } <-- 0% 30% "
exe "hi! cssKeyFrameSelector" .s:fg_orange
"------------ yellow -------------"
"------------ beige --------------"
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
"------------- lime --------------"
"【_Comment】】"
hi! link cssComment _Comment
"------------ green --------------"
" @charset "
exe "hi! cssIncludeKeyword" .s:fg_green
" @font-face "
exe "hi! cssFontDescriptor" .s:fg_green
"---------- light_blue -----------"
" selector:pseudo-class{} <-- pseudo-class "
exe "hi! cssPseudoClass" .s:fg_light_blue
" @page:first <-- :first "
exe "hi! cssPagePseudo" .s:fg_light_blue
" input:checked div:hover <-- :checked :hover "
exe "hi! cssPseudoClassId" .s:fg_light_blue
"---------- dark_blue ------------"

"【_CSS_Property】"
exe "hi! _CSS_Property" .s:fg_dark_blue
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

"------------ lilac --------------"
" url(img/arw.png) <-- img/arw.png "
exe "hi! cssURL" .s:fg_lilac
" url(sansation_light.woff) <-- sansation_light.woff "
exe "hi! cssFontDescriptorFunction" .s:fg_lilac
" unicode-range: U+000-5FF, U+1e00-1fff, U+2000-2300;"
exe "hi! cssFontDescriptorAttr" .s:fg_lilac
" content: open-quote <-- open quote "
exe "hi! cssGeneratedContentAttr" .s:fg_lilac

" input[type=radio] <-- type radio "
exe "hi! cssAttributeSelector" .s:fg_lilac
" :lang(en) :lang(no) <-- en no "
exe "hi! cssPseudoClassFn" .s:fg_lilac
" @media screen and print <-- screen print all "
exe "hi! cssMediaType" .s:fg_lilac
"------------ ??? ----------------"
"【_Unknown】"
hi! link cssMediaBlock _Unknown
hi! link cssError _Unknown
hi! link cssDefinition _Unknown
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
" -------------- base0 -------------------- "
" { } "dd
exe "hi! javaScriptBraces" .s:fg_base0

" alert() confirm() <-- alert confirm "
exe "hi! javaScriptMessage" .s:fg_base0
" window "
exe "hi! javaScriptGlobal" .s:fg_base0
" document "
exe "hi! javaScriptMember" .s:fg_base0
" if() function() <-- ( ) "
exe "hi! javaScriptParens" .s:fg_base0
" ------------- light_red ----------------- "
" new "
exe "hi! javaScriptOperator" .s:fg_light_red
" return "
exe "hi! javaScriptStatement" s:fg_light_red
" break "
exe "hi! javaScriptBranch" .s:fg_light_red
" var "
exe "hi! javaScriptIdentifier" .s:fg_light_red
" --------------- red --------------------- "
" function(){} <-- function "
exe "hi! javaScriptFunction" .s:fg_red
" if else end "
exe "hi! javaScriptConditional" .s:fg_red
" for "
exe "hi! javaScriptRepeat" .s:fg_red
" case "
exe "hi! javaScriptLabel" .s:fg_red
" --------------- lime -------------------- "
"【_Comment】"
" //some "
hi! link javaScriptLineComment _Comment
" /* some */ "
hi! link javaScriptComment _Comment
" -------------- beige -------------------- "
"【_String】"
" /,/g "
hi! link javaScriptRegexpString _String
" "some" "
hi! link javaScriptStringD _String
" 'some' "
hi! link javaScriptStringS _String
" ------------- dark_blue ----------------- "
" Date "
exe "hi! javaScriptType" .s:fg_dark_blue
" -------------- lilac -------------------- "
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
" -------------- base0 --------------
" class="" name="" id="" <-- class name id
exe "hi! htmlArg" .s:fg_base0
" onclick="method(aa,bb)" <-- onclick="method ,
exe "hi! htmlEvent" .s:fg_base0
" <a href="aaa">here</a> <-- here
exe "hi! htmlLink" .s:fg_base0

exe "hi! javaScript" .s:fg_base0
" ------------- red -----------------
" <tag> </tag> <-- tag
exe "hi! htmlTagName" .s:fg_red
" <script> </script> <-- script
exe "hi! htmlSpecialTagName" .s:fg_red
" ------------- lime ----------------
" 【_Comment】
" <!-- comment --> <-- -- comment --
hi! link htmlCommentPart _Comment
" <!-- comment --> <-- <! >
hi! link htmlComment _Comment
hi! link htmlCssStyleComment _Comment
" ------------- dark_blue -----------
exe "hi! htmlSpecialChar" .s:fg_dark_blue

" <tag> <div id=""> <-- < > \s =
exe "hi! htmlTag" .s:fg_dark_blue
" </tag> <-- </ >
exe "hi! htmlEndTag" .s:fg_dark_blue
" <script> <-- < >
exe "hi! htmlScriptTag" .s:fg_dark_blue
" -------------- beige --------------
" "aa" 'aa'
hi! link htmlString _String
" -------------- lilac --------------
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
exe "hi! juliaStringVarsPla"     .s:fg_lime
exe "hi! juliaStringVarDelim"    .s:fg_lime
exe "hi! juliaStringVarsPar"     .s:fg_lime
" }}}

" NERDTree {{{
exe "hi! NERDTreeCWD"            .s:fg_light_red
exe "hi! NERDTreeDirSlash"       .s:fg_yellow
exe "hi! NERDTreeHelp"           .s:fg_gold
exe "hi! NERDTreeHelpTitle"      .s:fg_yellow
exe "hi! NERDTreeHelpKey"        .s:fg_lilac
" }}}

" tex {{{
hi! link TexMathDelim Macro
exe "hi! TexMathOper"            .s:fg_light_blue
exe "hi! TexCite"                .s:fg_lime
" }}}

" sh {{{
hi! link shQuote String
" }}}

" markdown {{{
hi! link markdownUrl String
" }}}


