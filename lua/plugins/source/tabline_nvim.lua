require'tabline'.setup {}

vim.api.nvim_set_hl(0, 'tabline_current_tab', { bg = '#dcca77', fg = '#202020' })
vim.api.nvim_set_hl(0, 'tabline_inactive_tab', { bg = '#202020', fg = '#dcca77' })
