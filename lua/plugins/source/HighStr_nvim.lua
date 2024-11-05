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
local colors = require("high-str.tools.tool-highlight.modules.colors")

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
vim.api.nvim_set_keymap("v", "<f12>", ":<c-u>HSRmHighlight<cr>", { nowait = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<f12>", ":<c-u>HSRmHighlight rm_all<cr>", { nowait = true, noremap = true, silent = true })


-- 現在の検索パターンに一致する位置を取得して返す関数
function highstr_get_matches()
  local search_term = vim.fn.getreg('/')

  local matches = {}

  -- :vimgrepで検索パターンに一致する位置を取得
  vim.fn.execute('vimgrep /' .. search_term .. '/j %')

  -- 検索結果をリストに変換
  local qflist = vim.fn.getqflist()

  -- 各マッチの位置を取得
  for _, item in ipairs(qflist) do
    table.insert(matches, {item.lnum, item.col, item.end_col - 1})
  end

  return matches
end

function highstr_hl_all_matches(number)
  colors.parse_colors()
  local matches = highstr_get_matches()

  for _, pos in ipairs(matches) do
    local line, start_col, end_col = pos[1], pos[2], pos[3]

    local hi_group = colors.which_hi_group(number)
    local current_buffer = vim.api.nvim_eval([[bufnr('%')]])
    vim.api.nvim_buf_add_highlight(current_buffer, 0, hi_group, line - 1, start_col - 1, end_col)
  end
  vim.api.nvim_command("set nohlsearch")
end

local function fkey_hs_nmap_all_matches(key, number)
  vim.api.nvim_set_keymap('n', key, ":lua highstr_hl_all_matches("..number..")<CR>", { nowait = true, noremap = true, silent = true })
end

fkey_hs_nmap_all_matches("<f1>",  "1")
fkey_hs_nmap_all_matches("<f2>",  "2")
fkey_hs_nmap_all_matches("<f3>",  "3")
fkey_hs_nmap_all_matches("<f4>",  "4")
fkey_hs_nmap_all_matches("<f5>",  "5")
fkey_hs_nmap_all_matches("<f6>",  "6")
fkey_hs_nmap_all_matches("<f7>",  "7")
fkey_hs_nmap_all_matches("<f8>",  "8")
fkey_hs_nmap_all_matches("<f9>",  "9")
fkey_hs_nmap_all_matches("<f10>", "10")
fkey_hs_nmap_all_matches("<f11>", "0")
