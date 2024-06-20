-- https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- base helpers
	require("vnphanquang.plugins.which-key"),
	require("vnphanquang.plugins.notify"),

	-- UI enhancement
	require("vnphanquang.plugins.gruvbox-material"),
	{ "mhinz/vim-startify" }, -- https://github.com/mhinz/vim-startify
	-- https://github.com/xiyaowong/transparent.nvim
	-- runs ":TransparentEnable", result will be cached
	{ "xiyaowong/transparent.nvim" },
	require("vnphanquang.plugins.lualine"),

	-- Workflow enhancement
	require("vnphanquang.plugins.neo-tree"),
	require("vnphanquang.plugins.markdown-preview"),
	require("vnphanquang.plugins.treesitter"),
	require("vnphanquang.plugins.telescope"),
	require("vnphanquang.plugins.todo"),
	require("vnphanquang.plugins.undotree"),
	require("vnphanquang.plugins.spider"),
	 -- https://github.com/andrewferrier/wrapping.nvim
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup({})
		end,
	},

	-- essential development plugins
	require("vnphanquang.plugins.git"),
	require("vnphanquang.plugins.lsp"),
	require("vnphanquang.plugins.lsp.typescript-tools"),
	require("vnphanquang.plugins.conform"),
	require("vnphanquang.plugins.trouble"),
	{ "github/copilot.vim" }, -- https://github.com/github/copilot.vim

	-- development utilities
	require("vnphanquang.plugins.autopairs"),
	require("vnphanquang.plugins.surround"),
	require("vnphanquang.plugins.indent-blank-line"),
	require("vnphanquang.plugins.hop"),
	require("vnphanquang.plugins.illuminate"),
	require("vnphanquang.plugins.substitue"),
	require("vnphanquang.plugins.multiple-cursor"),
	{ "tpope/vim-sleuth" }, -- https://github.com/tpope/vim-sleuth
	{ "numToStr/Comment.nvim", opts = {} }, -- https://github.com/numToStr/Comment.nvim

	-- fun stuff
	{ "eandrju/cellular-automaton.nvim" }, -- https://github.com/Eandrju/cellular-automaton.nvim
})

