return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Files",
    },
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>f?",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Help tags",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Old files",
    },
    {
      "<leader>fm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fS",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").colorschemes()
      end,
      desc = "Colorscheme",
    },
    {
      "<leader>fH",
      function()
        require("fzf-lua").highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>fj",
      function()
        require("fzf-lua").jump()
      end,
      desc = "Jumplist",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "Live grep",
    },
    -- {
    --   "<leader>fn",
    --   function()
    --     -- To be implement
    --   end,
    --   desc = "Notify",
    -- },

    -- git
    {
      "<leader>fgc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Commits",
    },
    {
      "<leader>fgb",
      function()
        require("fzf-lua").git_branchs()
      end,
      desc = "Branchs",
    },
    {
      "<leader>fgt",
      function()
        require("fzf-lua").git_tags()
      end,
      desc = "Tags",
    },

    -- dap
    {
      "<leader>fde",
      function()
        require("fzf-lua").dap_commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fdc",
      function()
        require("fzf-lua").dap_configurations()
      end,
      desc = "Configurations",
    },
    {
      "<leader>fdb",
      function()
        require("fzf-lua").dap_breakpoints()
      end,
      desc = "Breakpoints",
    },
    {
      "<leader>fdv",
      function()
        require("fzf-lua").dap_variables()
      end,
      desc = "Variables",
    },
    {
      "<leader>fdf",
      function()
        require("fzf-lua").dap_frames()
      end,
      desc = "Frames",
    },
  },
--   config = function()
--     -- calling `setup` is optional for customization
--     require("fzf-lua").setup({})
--   end
}