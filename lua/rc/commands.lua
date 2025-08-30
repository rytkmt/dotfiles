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
