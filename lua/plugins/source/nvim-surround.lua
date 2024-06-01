require("nvim-surround").setup({
  surrounds = {
    [":"] = {
      add = { "**", "**" },
      find = function() end,
      delete = function() end
    },
  },
  aliases = {
    ["b"] = ":"
  }
})
