local M = {}

function M.select2ex()
  local v_pos = vim.fn.getpos('v')
  local line_v, col_v = v_pos[2], v_pos[3]
  local c_pos = vim.fn.getpos('.')
  local line_c, col_c = c_pos[2], c_pos[3]

  local line_start, line_end
  if line_v <= line_c then
    line_start, line_end = line_v, line_c
  else
    line_start, line_end = line_c, line_v
  end

  local lines = vim.fn.getline(line_start, line_end)
  local mode = vim.fn.mode()

  if mode == "<C-v>" then
    mode = 'v'
    if line_start < line_end then
      vim.cmd("echoerr 'block-wise selection unsupported, assuming character-wise selection'")
    end
  end

  if mode == "v" then
    local col_start, col_end
    if col_v <= col_c then
      col_start, col_end = col_v, col_c
    else
      col_start, col_end = col_c, col_v
    end

    lines[#lines] = string.sub(lines[#lines], 1, col_end - (vim.o.selection == "inclusive" and 0 or 1))
    lines[1] = string.sub(lines[1], col_start, -1)
  end

  local ending
  if vim.o.fileformat == "dos" then
    ending = "<CR><NL>"
  elseif vim.o.fileformat == "mac" then
    ending = "<CR>"
  else
    ending = "<NL>"
  end

  local text = table.concat(lines, ending)
  text = string.gsub(text, "^ *", "", 1)

  return text
end

function M.hoge()
  return "aa"
end

vim.cmd("vmap <expr> <C-e> ':<C-u>' . v:lua.require('rc.scripts').select2ex()")

return M
