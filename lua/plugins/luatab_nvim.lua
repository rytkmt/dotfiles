local M = require('luatab').helpers

require('luatab').setup {
  cell = function(index)
    local isSelected = vim.fn.tabpagenr() == index
    local buflist = vim.fn.tabpagebuflist(index)
    local winnr = vim.fn.tabpagewinnr(index)
    local bufnr = buflist[winnr]
    local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

    return hl .. '%' .. index .. 'T' .. ' ' ..
        M.windowCount(index) ..
        M.devicon(bufnr, isSelected) .. '%T' ..
        M.title(bufnr) .. ' ' ..
        M.modified(bufnr) ..
        M.separator(index)
  end
}
