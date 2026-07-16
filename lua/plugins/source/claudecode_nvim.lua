require('claudecode').setup({
  auto_start = false,
  terminal_cmd = "claude",
  terminal = {
    split_side = "right", -- "left" or "right"
    split_width_percentage = 0.30,
    provider = 'snacks',
    auto_close = true,
    snacks_win_opts = {
      position = "float",
      width = 0.9,
      height = 0.9,
      border = "rounded",
      title = " Claude Code ",
      title_pos = "center",
      keys = {
        claude_hide = { "<leader>rz", function(self) self:hide() end, mode = "t", desc = "Hide" },
      },
    },

    -- Provider-specific options
    provider_opts = {
      -- Command for external terminal provider. Can be:
      -- 1. String with %s placeholder: "alacritty -e %s" (backward compatible)
      -- 2. String with two %s placeholders: "alacritty --working-directory %s -e %s" (cwd, command)
      -- 3. Function returning command: function(cmd, env) return "alacritty -e " .. cmd end
      external_terminal_cmd = nil,
    },
  },
  diff_opts = {
    auto_close_on_accept = true,
    vertical_split = true,
    open_in_current_tab = false,
    keep_terminal_focus = false, -- If true, moves focus back to terminal after diff opens (including floating terminals)
  },
  focus_after_send = true,        -- 送信後にClaudeにフォーカス
  track_selection = true,         -- ビジュアル選択を追跡
  git_repo_cwd = true,            -- gitルートをcwdとして使用
})

-- auto_start=falseにして、VimEnter後にリトライ付きで起動する
-- (複数nvimセッション時にfind_available_portのbindテストが信頼できない問題への対策)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local max_attempts = 3
    for i = 1, max_attempts do
      local ok, _ = require('claudecode').start(i == max_attempts)
      if ok then
        -- ECONNRESETはCLI idle時の正常切断なのでERROR通知を抑制する
        local server_mod = require('claudecode.server')
        if server_mod.state.server then
          local original_on_error = server_mod.state.server.on_error
          server_mod.state.server.on_error = function(error_msg)
            if error_msg:find("ECONNRESET") then
              require("claudecode.logger").debug("server", "WebSocket server error:", error_msg)
            elseif error_msg:find("EADDRINUSE") then
              require("claudecode.logger").debug("server", "Init server error:", error_msg)
            else
              original_on_error(error_msg)
            end
          end
        end
        return
      end
      if i < max_attempts then vim.loop.sleep(50) end
    end
  end,
})

local map = vim.keymap.set

map("n", "<leader>rc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>rf", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>rr", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>rb", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })

-- ビジュアルモードでの送信
map("v", "<leader>rs", ":ClaudeCodeSend<cr>", { desc = "Send to Claude" })

-- 4. 特定のファイルタイプ（ツリーエクスプローラー等）での特殊な挙動
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  callback = function()
    map("n", "<leader>rs", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = true, desc = "Add file from tree" })
  end,
})

-- Diff操作
map("n", "<leader>ra", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>rd", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

-- render-markdown.nvim との競合によるクラッシュ回避 (https://github.com/coder/claudecode.nvim/pull/224)
vim.api.nvim_create_autocmd("User", {
  pattern = "ClaudeCodeDiffOpened",
  callback = function()
    vim.cmd("stopinsert")
    vim.cmd("RenderMarkdown disable")
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "ClaudeCodeDiffClosed",
  callback = function()
    vim.cmd("RenderMarkdown enable")
  end,
})
