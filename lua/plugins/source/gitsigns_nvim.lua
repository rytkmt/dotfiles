require('gitsigns').setup {
  signs = {
    add          = {text = '▎'},

    change       = {text = '▎'},
    delete       = {text = '▁'},

    topdelete    = {text = '▔'},
    changedelete = {text = '~'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`

  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  -- 廃止された
  -- current_line_blame_formatter_opts = {
  --   relative_time = false
  -- },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  -- 廃止された
  -- yadm = {
  --   enable = false
  -- },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then return ']g' end
      vim.schedule(function()
        gs.next_hunk()
        vim.cmd("normal! zz")
      end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[g', function()
      if vim.wo.diff then return '[g' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- 現在行の最終更新のコミット表示 =>変更した対象のコミットから対応を追いやすい
    map('n', 'gL', gs.blame_line)
    map('n', 'gA', gs.stage_buffer)
    map('n', 'ga', gs.stage_hunk)
    -- 直前のindexへの追加内容を取り消す
    map('n', 'gu', gs.undo_stage_hunk)
    -- Actions
    -- ローカルファイルの修正(未index状態)を取り消す
    map('n', 'gB', gs.reset_hunk)
    map('n', 'gi', gs.preview_hunk)
    map('n', 'gb', function()
      vim.schedule(function()
        gs.reset_hunk()
        gs.next_hunk()
        vim.cmd("normal! zz")
      end)
      return '<Ignore>'
    end)
  end
}

vim.cmd("hi GitSignsAdd guifg=#728a7f gui=none guibg=none")
vim.cmd("hi GitSignsAddPreview guifg=#a0a0b0 gui=none guibg=#1c3333")
vim.cmd("hi GitSignsDelete guifg=#d48585 gui=none guibg=none")
vim.cmd("hi GitSignsChange guifg=#819cdf gui=none guibg=none")
