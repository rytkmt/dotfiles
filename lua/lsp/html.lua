-- html: VSCode 付属の HTML 言語サーバー
-- https://github.com/hrsh7th/vscode-langservers-extracted
--
-- インストール（vscode-langservers-extracted に同梱、別途不要）:
--   npm install -g vscode-langservers-extracted
--
-- 主な機能:
--   - 補完 (completion): タグ名・属性名・属性値
--   - 診断 (diagnostics): 構文エラー
--   - ホバー情報 (hover): MDN ドキュメント参照
--   - ドキュメントシンボル (documentSymbols)
--   - フォーマット (formatting)
--   - リンクの検出 (documentLink)
--   - Emmet 展開（init_options で有効化）

return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  root_markers = { 'package.json', '.git' },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
  },
  settings = {},
}
