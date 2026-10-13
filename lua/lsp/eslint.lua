-- eslint: VSCode 付属の ESLint 言語サーバー
-- https://github.com/hrsh7th/vscode-langservers-extracted
--
-- インストール（cssls と同じパッケージ、既に入っていれば不要）:
--   npm install -g vscode-langservers-extracted
--
-- 主な機能:
--   - 診断 / エラー表示 (diagnostics): ESLint ルール違反を表示
--   - コードアクション (codeActions):
--       eslint.applyAllFixes: 全修正を一括適用
--       eslint.applyFix: 個別修正
--       source.fixAll.eslint: 保存時自動修正（autocmd と組み合わせて使用）
--
-- NOTE: フォーマットは prettier 等に任せ、ESLint はルール違反の検出に専念する運用が多い

return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_markers = {
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    '.eslintrc',
    'package.json',
    '.git',
  },
  settings = {
    validate = 'on',
    useESLintClass = false,
    -- 保存時に自動修正する（false にすると手動で :EslintFixAll 相当を実行）
    run = 'onType', -- 'onType' | 'onSave'
    workingDirectory = { mode = 'location' },
  },
}
