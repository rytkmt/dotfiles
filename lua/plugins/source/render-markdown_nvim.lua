require('render-markdown').setup({
  heading = {
    icons = { '󰓛 ', '󰓛󰓛 ', '󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛󰓛 ', '󰓛󰓛󰓛󰓛󰓛󰓛 ' },
    backgrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
  },
  indent = {
    enabled = true
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
vim.api.nvim_set_hl(0, "RenderMarkdownIndent", { fg = "#444282" })
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#282840" })
vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { fg = "#515960" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { bg = "#F82840" })

-- vim.api.nvim_set_hl(0, "RenderMarkdownHH1", { fg = "#d8d8d8", bg = "#787838" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownHH2", { fg = "#5c3a0a", bg = "#c89858" })
