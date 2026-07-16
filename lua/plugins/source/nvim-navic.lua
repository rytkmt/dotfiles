local navic = require('nvim-navic')
navic.setup {
  highlight = true,
  x = { 1, 2 },
  icons = {
    -- [ ruby ]
    Module        = "󰝵 ",
    Class         = "󰛹 ",
    Method        = " ",
    Constant      = " ",
    -- attr
    Property      = " ",

    -- [ lua ]
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Boolean       = "  ",
    String        = " ",
    Number        = "󰎠 ",
    Variable      = "󰆧 ",
    Function      = "󰊕 ",
    -- if/for
    Package       = " ",

    File          = "󰈙 ",
    Namespace     = "󰐷 ",
    Field         = "󰁥 ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 y",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = true,
  }
}
vim.api.nvim_set_hl(0, 'NavicIconsModule', { fg = '#448811' })
vim.api.nvim_set_hl(0, 'NavicIconsClass', { fg = '#998811' })
vim.api.nvim_set_hl(0, 'NavicIconsMethod', { fg = '#994433' })
vim.api.nvim_set_hl(0, 'NavicIconsConstant', { fg = '#6644aa' })
vim.api.nvim_set_hl(0, 'NavicIconsProperty', { fg = '#222299' })
vim.api.nvim_set_hl(0, 'NavicIconsNamespace', { fg = '#ba6733' })
vim.api.nvim_set_hl(0, 'NavicIconsField', { fg = '#ba6733' })

vim.api.nvim_set_hl(0, 'NavicIconsObject', { fg = '#aa7733' })
vim.api.nvim_set_hl(0, 'NavicIconsArray', { fg = '#7777cc' })
vim.api.nvim_set_hl(0, 'NavicIconsString', { fg = '#bb77aa' })
vim.api.nvim_set_hl(0, 'NavicIconsNumber', { fg = '#336633' })
vim.api.nvim_set_hl(0, 'NavicIconsBoolean', { fg = '#cccccc' })
vim.api.nvim_set_hl(0, 'NavicIconsVariable', { fg = '#6644aa' })
vim.api.nvim_set_hl(0, 'NavicIconsFunction', { fg = '#ddcc11' })
vim.api.nvim_set_hl(0, 'NavicIconsPackage', { fg = '#338822' })
