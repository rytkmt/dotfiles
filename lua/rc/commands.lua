vim.api.nvim_create_user_command('NewDiary', function(opts)
  local additional_day = tonumber(opts.args) or 0
  local date = os.date("%Y%m%d", os.time() + (additional_day * 24 * 60 * 60)) -- YYYYMMDD_HHMMSS 形式
  local diary_dir = os.getenv("DIARY_DIR")
  if diary_dir then
    local filename = diary_dir .. "/" .. date .. '.txt' -- 引数をプレフィックスとして結合、拡張子は任意
    vim.cmd('edit ' .. filename)
  else
    print("undefined $DIARY_DIR.")
  end
end, { nargs = "?", desc = 'Create a new file with date' })


-- vsnipがjsonで定義が必要だが、複数行が入力しづらい。文字列をjsonように整形してくれる自作コマンド
vim.api.nvim_create_user_command('VsnipFormat', function()
  -- 選択範囲の開始行と終了行を取得
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local formatted = {}
  for i, line in ipairs(lines) do
    -- バックスラッシュとダブルクォーテーションをエスケープ
    local escaped = line:gsub('\\', '\\\\'):gsub('"', '\\"')
    -- 最後の行以外にはカンマをつける
    if i == #lines then
      table.insert(formatted, string.format('"%s"', escaped))
    else
      table.insert(formatted, string.format('"%s",', escaped))
    end
  end

  -- 選択していた部分を置換
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, formatted)
end, { range = true })
