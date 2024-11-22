local map = vim.keymap
map.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { noremap = true, desc = "open oil" })
map.set("n", "H", "^", { noremap = true })
map.set("n", "L", "$", { noremap = true })
map.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, desc = "save file" })
map.set("n", "<leader>\\", "<cmd>vsplit<cr>", { noremap = true, desc = "split the window vertically" })

map.set("n", ";", ":", { desc = "CMD enter command mode" })
