require("ts_expand_hover").setup({
  keymaps = {
    hover = "[ft]h",         -- ノーマルモードでホバーを表示
    expand = "+",        -- フローティングウィンドウ内で型を 1 段階展開
    collapse = "-",      -- フローティングウィンドウ内で型を 1 段階縮小
    close = { "q", "<Esc>" }, -- ホバーウィンドウを閉じる
  },
  float = {
    border = "rounded",  -- ウィンドウ枠のデザイン ("rounded", "single", "double" など)
  },
})
