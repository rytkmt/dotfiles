require("nvim-surround").setup({
  surrounds = {
    [":"] = {
      add = { "**", "**" },
      find = function() end,
      delete = function() end
    },
    ["j"] = {
      add = { "「", "」" },
      find = function() end,
      delete = function() end
    },
    ["s"] = {
      add = { "~", "~" },
      find = function() end,
      delete = function() end
    }
  },
  aliases = {
    ["b"] = ":"
  }
})
