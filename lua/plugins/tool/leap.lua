return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "<C-'>", "<Plug>(leap)", {
      noremap = true, -- 推荐保持 noremap
      silent = true, -- 根据你的偏好设置
      desc = "Leap forward (Ctrl+')", -- 可选的描述，用于 which-key 等插件
    })
  end,
}
