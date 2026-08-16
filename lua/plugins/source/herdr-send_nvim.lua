require("herdr-send").setup({
  agent_cmd = "kiro-cli"
})

local map = vim.keymap.set

map("v", "<leader>hs", "<cmd>HerdrSendSelection<cr>", { desc = "Send selection to herdr agent" })
map("n", "<leader>hb", "<cmd>HerdrSendBuffer<cr>", { desc = "Send buffer to herdr agent" })
map("n", "<leader>hp", "<cmd>HerdrSendPrompt<cr>", { desc = "Send prompt to herdr agent" })
