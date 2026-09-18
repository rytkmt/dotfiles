-- grep結果などの "path:11" / "path:11:5" を渡されたら、行番号を剥がして該当行へジャンプする
local function open_with_line(name)
  -- 末尾の余分な ":" も許容: path:11 / path:11: / path:11:5 / path:11:5:
  local path, line = name:match('^(.-):(%d+):?%d*:?$')
  if not path or vim.fn.filereadable(name) == 1 then
    return -- パターン外、または "path:11" 自体が実在するファイルなら何もしない
  end
  if vim.fn.filereadable(path) == 0 then
    return -- 行番号を剥がしたパスも存在しないなら触らない
  end

  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('keepalt edit ' .. vim.fn.fnameescape(path))
  -- BufReadCmd 経由だと標準の filetype 検出がスキップされるため、edit 直後に同期で走らせる
  -- （LSP/Treesitter/ftplugin の初期化順を通常フローに近づける）
  if vim.bo.filetype == '' then
    vim.cmd('filetype detect')
  end
  vim.schedule(function()
    local total = vim.api.nvim_buf_line_count(0)
    vim.api.nvim_win_set_cursor(0, { math.min(tonumber(line), total), 0 })
    vim.cmd('normal! zz')
  end)
  -- "path:11" という空バッファを掃除
  if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_get_name(bufnr):match(':%d+:?%d*:?$') then
    pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
  end
end

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadCmd' }, {
  group = vim.api.nvim_create_augroup('OpenWithLineNumber', {}),
  pattern = { '*:[0-9]*' },
  callback = function(args)
    open_with_line(args.match)
  end,
})
