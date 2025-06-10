local map = vim.keymap.set

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { noremap = true, desc = "open oil" })
map("n", "H", "^", { noremap = true })
map("n", "L", "$", { noremap = true })

-- win
map("n", "<leader>o", "<C-w>w", { desc = "Switch to next window", noremap = true, silent = true })
map("n", "<leader>1", "<C-w>o", { desc = "Close other windows (Only)", noremap = true, silent = true })
map("n", "<leader>2", "<C-w>s", { desc = "Split window horizontally", noremap = true, silent = true })
map("n", "<leader>3", "<C-w>v", { desc = "Split window vertically", noremap = true, silent = true })
map("n", "<leader>0", "<C-w>c", { desc = "Close current window", noremap = true, silent = true })
