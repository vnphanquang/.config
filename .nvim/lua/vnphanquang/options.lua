vim.g.editorconfig = true
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.opt.undolevels = 100
vim.opt.undofile = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- cursor
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.expandtab = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

