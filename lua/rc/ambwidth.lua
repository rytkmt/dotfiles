-- nnoremap g? ga としているので g? でUnicodeコード確認(Hex値)
-- inoremap <C-g> <C-v> としてるので <C-g>u203b とすると※が打てる

vim.call("setcellwidths", {
  { 0x203b, 0x203b, 2 }, -- ※
  { 0x2460, 0x2473, 2 }, -- ① ~ ⑳
})
