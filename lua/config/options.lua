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
