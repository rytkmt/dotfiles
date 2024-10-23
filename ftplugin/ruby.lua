require("nvim-surround").buffer_setup({
  surrounds = {
    ["#"] = {
      add = { "#{", "}" },
      find = function() end,
      delete = function() end
    },
  }
})
