return {
  "Shatur/neovim-session-manager",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local manager = require("session_manager")
    local config = require("session_manager.config")

    manager.setup {
      autoload_mode = config.AutoloadMode.Disabled
    }
  end,
  keys = {
    { "<leader>ss", "<cmd>SessionManager load_session<CR>", desc = "Load selected" },
    { "<leader>sl", "<cmd>SessionManager load_last_session<CR>", desc = "Load last session" },
    { "<leader>sd", "<cmd>SessionManager delete_session<CR>", desc = "Delete session" },
    { "<leader>sc", "<cmd>SessionManager load_current_dir_session<CR>", desc = "Load current" }
  }
}
