-- cssls: VSCode 付属の CSS / LESS / SCSS 言語サーバー
-- https://github.com/hrsh7th/vscode-langservers-extracted
--
-- インストール:
--   npm install -g vscode-langservers-extracted
--
-- 主な機能:
--   - 補完 (completion): プロパティ名・値・セレクタ
--   - 診断 / エラー表示 (diagnostics): 構文エラー・未知プロパティ
--   - ホバー情報 (hover): MDN ドキュメント参照
--   - ドキュメントシンボル (documentSymbols): セレクタ一覧
--   - フォーマット (formatting)
--   - カラーピッカー (documentColor, colorPresentation)

return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'less', 'scss' },
  root_markers = { 'package.json', '.git' },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    css = { validate = true },
    less = { validate = true },
    scss = { validate = true },
  },
}
