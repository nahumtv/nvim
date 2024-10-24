vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Setting options `:help vim.opt` `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.showmode = falsie -- Don't show the mode, since it's already in the status line
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
end)
vim.opt.breakindent = true
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- Displays which-key popup sooner
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 7 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
