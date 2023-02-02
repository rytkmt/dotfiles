require("high-str").setup({
  verbosity = 0,
  saving_path = "/tmp/highstr/",
  highlight_colors = {
    -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
    color_0  = {"#848898", "smart"},
    color_1  = {"#98bb6c", "smart"},
    color_2  = {"#76946a", "smart"},
    color_3  = {"#7aa89f", "smart"},
    color_4  = {"#a3d4d5", "smart"},
    color_5  = {"#7e9cd8", "smart"},
    color_6  = {"#957fb8", "smart"},
    color_7  = {"#e46876", "smart"},
    color_8  = {"#d27e99", "smart"},
    color_9  = {"#dca561", "smart"},
    color_10 = {"#e6c384", "smart"},
  }
})

local function fkey_hs_vmap(key, number)
  vim.api.nvim_set_keymap("v", key, ":<c-u>HSHighlight ".. number .. "<cr>", { nowait = true, noremap = true, silent = true })
end
local function fkey_hs_vmap(key, number)
  vim.api.nvim_set_keymap("v", key, ":<c-u>HSHighlight ".. number .. "<cr>", { nowait = true, noremap = true, silent = true })
end


fkey_hs_vmap("<f1>",  "1")
fkey_hs_vmap("<f2>",  "2")
fkey_hs_vmap("<f3>",  "3")
fkey_hs_vmap("<f4>",  "4")
fkey_hs_vmap("<f5>",  "5")
fkey_hs_vmap("<f6>",  "6")
fkey_hs_vmap("<f7>",  "7")
fkey_hs_vmap("<f8>",  "8")
fkey_hs_vmap("<f9>",  "9")
fkey_hs_vmap("<f10>", "10")
fkey_hs_vmap("<f11>", "0")

vim.api.nvim_set_keymap("n", "<f12>", ":<c-u>HSRmHighlight<cr>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<f12>", ":<c-u>HSRmHighlight<cr>", { nowait = true, noremap = true, silent = true })
