require('render-markdown').setup({
  heading = {
    icons = { '󰓛 ', '󰓛󰓛 ', '󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛󰓛󰓛 ' },
  },
  code = {
    language_border = '󱘹',
    language_left = "󱘹󱘹 ",
    language_right = " 󱘹󱘹󱘹󱘹󱘹󱘹󱘹󱘹",
    border = 'thin',
    above = '󱘹',
    below = '󱘹',
    -- highlight_border = '',
    width = 'block',
    left_pad = 0,
    right_pad = 4
  }
})
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#282840" })
vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = "#191927" })
