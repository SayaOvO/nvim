return {
  "L3MON4D3/LuaSnip",
  event = {
    "InsertEnter",
    "CmdlineEnter"
  },
  dependencies = {
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  keys = {
    {
      "<C-l>",
      function()
        require("luasnip").expand()
      end,
      mode = "i",
    }
  },
  config = function()
    local snip = require "luasnip"
    require("luasnip.loaders.from_vscode").lazy_load()
    snip.filetype_extend("javascriptreact", { "javascript" })
    snip.filetype_extend("typescript", { "javascript" })
    snip.filetype_extend("typescriptreact", { "javascript" })

    snip.filetype_extend("typescriptreact", { "javascriptreact" })
  end
}
