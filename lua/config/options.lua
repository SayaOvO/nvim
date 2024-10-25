local options = {
	-- relativenumber = true,
	-- number = true,
	tabstop = 2, -- 2 spaces for a tab
	shiftwidth = 2, -- 2 spaces for indent width
	expandtab = true, -- use spaces instead tab
	autoindent = true,
	wrap = false,
	ignorecase = true,
	smartcase = true,
	cursorline = true,
	-- cursorlineopt = "number",
	termguicolors = true,
	background = "light",
	signcolumn = "yes",
	backspace = "indent,eol,start",
	splitright = true,
	splitbelow = true,
	swapfile = true,
	cmdheight = 0,
	-- timeoutlen = 100,
	writebackup = false,
	scrolloff = 8,
	sidescrolloff = 8,
	smartindent = true,
	encoding = "utf-8",
	-- ruler = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- disable diagnostic here
vim.diagnostic.config({ virtual_text = false })
vim.g.background = "light"

vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#687085" })

-- neovide relate
vim.o.guifont = "MonoLisa Nasy:h9:i"
if vim.g.neovide then
	vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
	vim.api.nvim_set_keymap("n", "<sc-v>", 'l"+P', { noremap = true })
	vim.api.nvim_set_keymap("v", "<sc-v>", '"+P', { noremap = true })
	vim.api.nvim_set_keymap("c", "<sc-v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true })
	vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>l"+Pli', { noremap = true })
	vim.api.nvim_set_keymap("t", "<sc-v>", '<C-\\><C-n>"+Pi', { noremap = true })
	vim.g.neovide_cursor_vfx_mode = "torpedo"
end
