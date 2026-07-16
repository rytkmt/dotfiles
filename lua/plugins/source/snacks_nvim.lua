require("snacks").setup({
  -- ここで使いたい機能を true にします
  bigfile = { enabled = true },      -- 大容量ファイルの処理最適化
  dashboard = { enabled = false },    -- かっこいい起動画面 packerを使ってるとエラーになるためfalseに
  notifier = { enabled = false },     -- 綺麗な通知ポップアップ
  quickfile = { enabled = true },    -- ファイル読み込みの高速化
  statuscolumn = { enabled = false }, -- 行番号横の表示を綺麗に
  words = { enabled = false },        -- カーソル下の単語をハイライト

  -- claudecode で使うならこれは必須！
  terminal = {
    enabled = true,
    -- フローティングウィンドウの見た目をカスタマイズ可能
    win = {
      style = "float", -- float または terminal (画面分割)
      border = "rounded",
    }
  },
})

-- snacks 独自の便利なキーマップを設定
-- local map = vim.keymap.set

-- 通知履歴を表示
-- map("n", "<leader>un", function() Snacks.notifier.show_history() end, { desc = "Notification History" })

-- ターミナルを単体でトグル（Claude以外でも使える）
-- map("n", "<leader>fT", function() Snacks.terminal.toggle() end, { desc = "Terminal" })
