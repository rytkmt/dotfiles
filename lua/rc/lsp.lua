-- Neovimの診断表示設定
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    format = function(diagnostic)
      -- 診断メッセージのカスタムフォーマット
      local formats = { "[%s] " }
      local values = { diagnostic.source }
      if diagnostic.code then
        table.insert(formats, "%s: ")
        table.insert(values, diagnostic.code)
      end
      table.insert(formats, "%s")
      table.insert(values, diagnostic.message)

      -- unpackはlua5.2になったらtable.unpackになるはずなので、コケたら要確認
      return string.format(table.concat(formats, ""), unpack(values))
    end,
  },
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
