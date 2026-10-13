-- =============================================================================
-- Emmet Cheat Sheet / Cheat Sheet for emmet-language-server
-- =============================================================================
--
-- [HTML 基本]
--   div.container             --> <div class="container"></div>
--   h1#title                  --> <h1 id="title"></h1>
--   p.text.active             --> <p class="text active"></p>
--   a[href="#"][target="_blank"] --> <a href="#" target="_blank"></a>
--   p{Text content}           --> <p>Text content</p>
--
-- [階層関係]
--   ul>li                     --> <ul><li></li></ul> (子要素)
--   div+p+bq                  --> <div></div><p></p><blockquote></blockquote> (兄弟要素)
--   div>p^main                --> <div><p></p></div><main></main> (親要素に登る)
--   (div>p)*2                 --> <div><p></p></div><div><p></p></div> (グループ化)
--
-- [繰り返し & 連番]
--   ul>li*3                   --> 3つの li を生成
--   ul>li.item$*3             --> li.item1, li.item2, li.item3 ($: 1からの連番)
--   ul>li.item$$*3            --> li.item01, li.item02, li.item03 ($$: 桁数揃え)
--   ul>li.item$@3*3           --> li.item3, li.item4, li.item5 (@N: Nから開始)
--   ul>li.item$@-1*3          --> li.item3, li.item2, li.item1 (@-1: 逆順)
--
-- [主要構造・タグ展開の短縮形]
--   ! または html:5            --> HTML5の初期ボイラープレートテンプレート
--   a:blank                   --> <a href="http://" target="_blank" rel="noopener noreferrer">
--   link:css                  --> <link rel="stylesheet" href="style.css">
--   script:src                --> <script src=""></script>
--   input:t                   --> <input type="text">
--   input:c                   --> <input type="checkbox">
--   input:s                   --> <input type="submit" value="">
--   btn                       --> <button></button>
--   btn:s                     --> <button type="submit"></button>
--   form:g                    --> <form action="" method="get"></form>
--
-- [CSS 記法]
--   m10                       --> margin: 10px;
--   m10-20                    --> margin: 10px 20px;
--   p10p                      --> padding: 10%;
--   m10auto                   --> margin: 10px auto;
--   pos:a / pos:r / pos:f    --> position: absolute / relative / fixed;
--   t0!                       --> top: 0 !important;
--   df / db / dib / dn        --> display: flex / block / inline-block / none;
--   jify:c / aitm:c           --> justify-content: center; / align-items: center;
--   fz16 / fw600 / lh1.5      --> font-size: 16px; / font-weight: 600; / line-height: 1.5;
--   bgc#f00                   --> background-color: #f00;
--   c#333                     --> color: #333;
--   w100p / h100vh            --> width: 10
--
-- [React 特有の自動変換 (Emmet 展開時)]
--   div.box                   --> <div className="box"></div>  (class -> className)
--   label[for=name]           --> <label htmlFor="name"></label> (for -> htmlFor)
--   input:t                   --> <input type="text" />        (自己閉じタグに自動整形)
--
-- [よく使う JSX パターン]
--   div.flex.items-center     --> <div className="flex items-center"></div>
--   ul>li*3                   --> <ul>
--                                   <li></li>
--                                   <li></li>
--                                   <li></li>
--                                 </ul>
--   button.btn[type=button]   --> <button className="btn" type="button"></button>
--
-- [JSX 内での動的埋め込み・連番]
--   div.card*3>{Card $}       --> <div className="card">Card 1</div> ...
--   ul>li.item$*3>{Item $}    --> <li className="item1">Item 1</li> ...
--
-- [フラグメント・コンポーネント展開]
--   > 記法と組み合わせ      --> <><div></div></> (フラグメント構文)
--   MyComponent               --> <MyComponent></MyComponent>
--   MyComponent#id.class      --> <MyComponent id="id" className="class"></MyComponent>
--   MyComponent[data={val}]   --> <MyComponent data={val}></MyComponent>
return {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = {
    'css',
    'scss',
    'html',
    'javascriptreact',
    'typescriptreact',
  },
  root_markers = { '.git', 'package.json' },
  init_options = {
    showSuggestionsAsSnippets = true,
  },
}
