--
-- greatly inspired by https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
--

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map jj to Esc
vim.keymap.set("i", "jj", "<Esc>", { desc = "jj as Esc alias" })

-- Window Splitting
vim.keymap.set("n", "<C-w>\\", ":vsplit<CR>", { desc = "split window horizontally to the bottom" })
vim.keymap.set("n", "<C-w>-", ":split<CR>", { desc = "split window vertically to the right" })

-- Move quickly to start / end of line
vim.keymap.set({ "n", "o", "v" }, "H", "^", { desc = "move to start of line" })
vim.keymap.set({ "n", "o", "v" }, "L", "$", { desc = "move to end of line" })

-- Keep cursor consistent
vim.keymap.set("n", "J", "mzJ`z", { desc = "join line but keep cursor position" })
vim.keymap.set("n", "n", "nzzzv", { desc = "move to next search result and center the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "move to previous search result and center the screen" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down half screen and center the screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up half screen and center the screen" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move down one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move up one line" })

-- Yanking & Pasting
vim.keymap.set("n", "Y", "y$", { desc = "yank from cursor till the end of line" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank into the os clipboard register" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line into the os clipboard register" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "parse into the os clipboard register" })

-- Into the void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete and yank into void" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "parse over and yank into void" })

-- Quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "go to next quickfix item" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "go to previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "go to next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "go to previous location list item" })

-- Miscellaneous
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make the file e[x]ecutable" })
vim.keymap.set(
	"n",
	"<leader>mr",
	"<cmd>CellularAutomaton make_it_rain<CR>",
	{ desc = "[m]ake it [r]ain with CellularAutomaton" }
)
vim.keymap.set(
	"n",
	"<leader><leader>gs",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "[g]o prompt to replace the word under the cur[s]or" }
)

-- Spelling
vim.keymap.set("n", "<leader>mslv", function()
	vim.opt.spelllang = "vi"
end, { desc = "set [s]pelling language to [v]ietnamese" })

vim.keymap.set("n", "<leader>msle", function()
	vim.opt.spelllang = "en"
end, { desc = "set [s]pelling language to [e]nglish" })

vim.keymap.set("n", "<leader>msla", function()
	---@diagnostic disable-next-line: missing-fields
	vim.opt.spelllang = { "en", "vi" }
end, { desc = "set [s]pelling language to include [a]ll" })

vim.keymap.set("n", "<leader>msa", function()
	vim.cmd("normal! zg")
end, { desc = "[s]pelling [a]dd to spellfile" })

vim.keymap.set("n", "<leader>msd", function()
	vim.cmd("normal! zug")
end, { desc = "[s]pelling [d]elete from spellfile" })

vim.keymap.set({ "n", "v" }, "<leader>mss", function()
	vim.cmd("normal! 1z=")
end, { desc = "[s]pelling apply [s]uggestion" })
