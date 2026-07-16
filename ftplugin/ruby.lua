require("nvim-surround").buffer_setup({
  surrounds = {
    ["#"] = {
      add = { "#{", "}" },
      find = function() end,
      delete = function() end
    },
  }
})

local function detect_model_word(path)
  local is_singular
  local model

  if string.match(path, '^app/models/cm_core/[^/]*%.rb') then
    is_singular = true
    model = string.match(path, '^app/models/cm_core/([^/]*)%.rb')

  elseif string.match(path, '^spec/models/cm_core/[^/]*%.rb') then
    is_singular = true
    model = string.match(path, '^spec/models/cm_core/([^/]*)%.rb')

  elseif string.match(path, '^spec/factories/[^/]*%.rb') then
    is_singular = true
    model = string.match(path, '^spec/factories/([^/]*)%.rb')

  elseif string.match(path, '^db/tables/[^/]*%.schema') then
    is_singular = false
    model = string.match(path, '^db/tables/([^/]*)%.schema')
  end

  return is_singular, model
end

local function detect_singular_model_word(path)
  local is_singular, model = detect_model_word(path)
  vim.print(model)
  local singular_model
  if is_singular then
    singular_model = model
  else
    singular_model = require("rytkmt.utils.inflector").singularize(model)
  end
  return singular_model
end

local function detect_plural_model_word(path)
  local is_singular, model = detect_model_word(path)
  local plural_model
  if is_singular then
    plural_model = require("rytkmt.utils.inflector").pluralize(model)
  else
    plural_model = model
  end
  return plural_model
end

local function open_model_file()
  local path = vim.fn.FilePathUnderRoot()
  local singular_model = detect_singular_model_word(path)

  if singular_model then
    local model_path = "app/models/cm_core/"..singular_model..".rb"
    vim.fn.mkdir(vim.fn.fnamemodify(model_path, ":h"), "p")
    vim.cmd("vs " .. model_path)
  end
end

local function open_spec_file()
  local path = vim.fn.FilePathUnderRoot()

  local spec_path = path:gsub('^app/', 'spec/'):gsub('%.rb', '_spec%.rb')
  vim.fn.mkdir(vim.fn.fnamemodify(spec_path, ":h"), "p")
  vim.cmd("vs " .. spec_path)
end
local function open_app_file()
  local path = vim.fn.FilePathUnderRoot()

  local app_path = path:gsub('^spec/', 'app/'):gsub('_spec%.rb', '%.rb')
  vim.fn.mkdir(vim.fn.fnamemodify(app_path, ":h"), "p")
  vim.cmd("vs " .. app_path)
end

local function open_factory_file()
  local path = vim.fn.FilePathUnderRoot()
  local singular_model = detect_singular_model_word(path)

  if singular_model then
    local factory_path = "spec/factories/" .. singular_model .. ".rb"
    vim.cmd("vs " .. factory_path)
  end
end

local function open_schema_file()
  local path = vim.fn.FilePathUnderRoot()
  local plural_model = detect_plural_model_word(path)

  if plural_model then
    local schema_path = "db/tables/"..plural_model..".schema"
    vim.cmd("vs " .. schema_path)
  end
end

vim.api.nvim_create_user_command("OpenModelFile", open_model_file, {})
vim.api.nvim_create_user_command("OpenSpecFile", open_spec_file, {})
vim.api.nvim_create_user_command("OpenAppFile", open_app_file, {})
vim.api.nvim_create_user_command("OpenFactoryFile", open_factory_file, {})
vim.api.nvim_create_user_command("OpenSchemaFile", open_schema_file, {})

local keymap_option = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(0, "n", "[ft]m", "<cmd>OpenModelFile<CR>", keymap_option)
vim.api.nvim_buf_set_keymap(0, "n", "[ft]s", "<cmd>OpenSpecFile<CR>", keymap_option)
vim.api.nvim_buf_set_keymap(0, "n", "[ft]a", "<cmd>OpenAppFile<CR>", keymap_option)
vim.api.nvim_buf_set_keymap(0, "n", "[ft]f", "<cmd>OpenFactoryFile<CR>", keymap_option)
vim.api.nvim_buf_set_keymap(0, "n", "[ft]d", "<cmd>OpenSchemaFile<CR>", keymap_option)

vim.api.nvim_buf_set_keymap(0, "n", "gf", "<cmd>lua require'rytkmt.formatter'.rubocop()<cr>", keymap_option)
