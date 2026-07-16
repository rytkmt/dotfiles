local chowcho = require('chowcho')
chowcho.setup {
  icon_enabled = true, -- required 'nvim-web-devicons' (default: false)
  text_color = '#FFFFFF',
  bg_color = '#555555',
  active_border_color = '#0A8BFF',
  border_style = 'rounded', -- 'default', 'rounded',
  use_exclude_default = false,
  exclude = function(buf, _)
    -- Exclude a window from the choice based on its buffer information.
    -- This option is applied iff `use_exclude_default = false`.
    -- Note that below is identical to the `use_exclude_default = true`.
    local fname = vim.fn.expand('#' .. buf .. ':t')
    return fname == ''
  end
}

-- <C-w>xと<C-w><C-x>を同時に設定する
local win_keymap_set = function(key, callback)
  vim.keymap.set({ 'n', 't' }, '<C-w>' .. key, callback)
  vim.keymap.set({ 'n', 't' }, '<C-w><C-' .. key .. '>', callback)
end

win_keymap_set('w',
  function()
    local wins = 0

    -- 全ウィンドウをループ
    for i = 1, vim.fn.winnr('$') do
      local win_id = vim.fn.win_getid(i)
      local conf = vim.api.nvim_win_get_config(win_id)

      -- focusableなウィンドウをカウント
      if conf.focusable then
        wins = wins + 1

        -- ウィンドウ数が3以上ならchowchoを起動
        if wins > 2 then
          chowcho.run()
          return
        end
      end
    end

    -- ウィンドウが少なければ標準の<C-w><C-w>を実行
    vim.api.nvim_command('wincmd w')
  end
)
