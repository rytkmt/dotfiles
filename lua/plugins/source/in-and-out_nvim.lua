require("in-and-out").setup({})
vim.keymap.set("i", "<C-o>", function() require("in-and-out").in_and_out() end)
