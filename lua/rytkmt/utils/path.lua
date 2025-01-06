local M = {}

M.path = {
  exists = function(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
  end,
  join = function(...)
    local path_separator = "/"
    return table.concat(vim.tbl_flatten({ ... }), path_separator):gsub(path_separator .. "+", path_separator)
  end,
}

M.find_git_project_root = function()
  local path = vim.fn.expand('%:p')
  while #path > 1 do
    path = vim.fn.fnamemodify(path, ':h')
    if vim.fn.isdirectory(path .. '/.git') ~= 0 or
      vim.fn.filereadable(path .. '/README.md') ~= 0 or
      vim.fn.filereadable(path .. '/Gemfile') ~= 0 then

      return path
    end
  end

  -- 無かったら現在のバッファのディレクトリを返す
  print("not found git root")
  return vim.fn.expand("%:h")
end

M.git_project_root_with_cache = function()
  if vim.b.git_project_root == nil then
    vim.b.git_project_root = M.find_git_project_root()
  end
  return vim.b.git_project_root
end


-- Gitのプロジェクトルートを見つける関数（以前に定義したものを使用）
M.find_git_project_root = function()
  local pathMaker = vim.fn.expand('%:p')
  while #pathMaker > 1 do
    pathMaker = vim.fn.fnamemodify(pathMaker, ':h')
    if vim.fn.isdirectory(pathMaker .. '/.git') ~= 0 or
      vim.fn.filereadable(pathMaker .. '/README.md') ~= 0 or
      vim.fn.filereadable(pathMaker .. '/README.rdoc') ~= 0 then
      return pathMaker
    end
  end

  -- 無かったら現在のバッファのディレクトリを返す
  print("not found git root")
  return vim.fn.expand("%:h")
end

-- -- FilePathUnderRoot
-- M.file_path_under_root = function()
--   return vim.fn.substitute(vim.fn.expand("%:p"), M.find_git_project_root() .. "/", "", "")
-- end
--
-- -- FilePathUnderRootWithCache
-- M.file_path_under_root_with_cache = function()
--     if vim.b.file_path_under_root == nil then
--         vim.b.file_path_under_root = M.file_path_under_root()
--     end
--     return vim.b.file_path_under_root
-- end
--
-- -- FileDirUnderRoot
-- M.file_dir_under_root = function()
--   return vim.fn.substitute(vim.fn.expand("%:p:h"), M.find_git_project_root() .. "/", "", "")
-- end
--
-- -- FileDirUnderRootWithCache
-- M.file_dir_under_root_with_cache = function()
--   if vim.b.file_dir_under_root == nil then
--     vim.b.file_dir_under_root = M.file_dir_under_root()
--   end
--   return vim.b.file_dir_under_root
-- end

M.make_full_path_under_root = function(file_path)
  return M.path.join(
    M.git_project_root_with_cache(),
    file_path
  )
end

return M
