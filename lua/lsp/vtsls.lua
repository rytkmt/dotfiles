-- vtsls: VSCode の TypeScript 拡張をラップした LSP サーバー
-- https://github.com/yioneko/vtsls
--
-- 主な機能（VSCode の TypeScript 拡張とほぼ同等）:
--   - 補完 (completion)
--   - 定義ジャンプ / 型定義ジャンプ (definition, typeDefinition)
--   - ホバー情報 (hover)
--   - 診断 / エラー表示 (diagnostics)
--   - シグネチャヘルプ (signatureHelp)
--   - シンボル検索 (documentSymbols, workspaceSymbols)
--   - 参照検索 (references)
--   - リネーム (rename)
--   - フォーマット (formatting, rangeFormatting)
--   - コードアクション (codeActions):
--       source.organizeImports, source.sortImports, source.removeUnusedImports,
--       source.fixAll.ts, source.addMissingImports.ts
--   - リファクタリング (refactor):
--       extract.function, extract.constant, extract.type, extract.interface,
--       move.newFile, move.file, rewrite.import, rewrite.export,
--       rewrite.arrow.braces, rewrite.property.generateAccessors
--   - コードレンズ (codeLens): 参照数の表示など
--   - インレイヒント (inlayHints): パラメータ名・変数型・戻り値型
--   - ファイルリネーム時のパス自動更新 (workspace/didRenameFiles)
--   - モノレポ対応（tsconfig.json を自動検出、複数インスタンス不要）
--   - Deno プロジェクトでは起動しない（root_dir で除外）
--
-- コマンド（vim.lsp.buf.execute_command 等で呼び出し可能）:
--   typescript.organizeImports, typescript.sortImports,
--   typescript.removeUnusedImports, typescript.restartTsServer,
--   typescript.goToSourceDefinition, typescript.findAllFileReferences

return {
  cmd = { 'vtsls', '--stdio' },
  init_options = {
    hostInfo = 'neovim',
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_markers = { '.git', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' },
  settings = {
    typescript = {
      inlayHints = {
        -- 関数呼び出し時の引数名をヒント表示（literals のみ有効、all にすると全引数）
        parameterNames = { enabled = 'literals' },
        -- 変数の推論型をヒント表示
        variableTypes = { enabled = false },
        -- 関数の戻り値型をヒント表示
        returnTypes = { enabled = false },
      },
    },
    vtsls = {
      -- プロジェクトの tsdk を優先して使用（バンドル版 TypeScript より workspace 版を使う）
      autoUseWorkspaceTsdk = true,
    },
  },
}
