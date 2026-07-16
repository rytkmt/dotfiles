local M = {}

-- 文字列をデリミタで分割する関数
function M.split(s, delimiter)
  local result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end
  return result;
end

return M
