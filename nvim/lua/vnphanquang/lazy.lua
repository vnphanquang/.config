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
	spec = {
		{
			"vhyrro/luarocks.nvim",
			priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
			opts = {
				rocks = { "magick" }, -- specifies a list of rocks to install
			},
		},
		{ "tpope/vim-sleuth" },
		require("vnphanquang.plugins.which-key"),
		require("vnphanquang.plugins.noice"),

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
		require("vnphanquang.plugins.mini"),
		require("vnphanquang.plugins.spider"),

		-- essential development plugins
		require("vnphanquang.plugins.git"),
		require("vnphanquang.plugins.lsp"),
		require("vnphanquang.plugins.lsp.typescript-tools"),
		require("vnphanquang.plugins.conform"),
		require("vnphanquang.plugins.trouble"),
		{ "github/copilot.vim" }, -- https://github.com/github/copilot.vim

		-- development utilities
		require("vnphanquang.plugins.indent-blank-line"),
		require("vnphanquang.plugins.hop"),
		require("vnphanquang.plugins.illuminate"),
		require("vnphanquang.plugins.multiple-cursor"),
		{ "numToStr/Comment.nvim", opts = {} }, -- https://github.com/numToStr/Comment.nvim
		{ "wakatime/vim-wakatime", lazy = false }, -- https://wakatime.com/neovim
		-- { -- https://github.com/mistricky/codesnap.nvim
		-- 	"mistricky/codesnap.nvim",
		-- 	build = "make",
		-- 	keys = {
		-- 		-- FIXME: keep track of this bug https://github.com/mistricky/codesnap.nvim/issues/103
		-- 		{ "<leader>cc", "<Esc><cmd>CodeSnap<cr>", mode = { "x", "v" }, desc = "Codesnap: save selected code snapshot into clipboard" },
		-- 		{ "<leader>cs", "<Esc><cmd>CodeSnapSave<cr>", mode = { "x", "v" }, desc = "Codesnap: save selected code snapshot in ~/Pictures" },
		-- 	},
		-- 	opts = {
		-- 		save_path = "~/Pictures",
		-- 		has_breadcrumbs = true,
		-- 		watermark = "",
		-- 		bg_padding = 0,
		-- 		code_font_family = "FiraCode Nerd Font",
		-- 		has_line_number = true,
		-- 		show_workspace = true,
		-- 	},
		-- },

		-- fun stuff
		{ "eandrju/cellular-automaton.nvim" }, -- https://github.com/Eandrju/cellular-automaton.nvim
		{ -- https://github.com/s1n7ax/nvim-window-picker
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			event = "VeryLazy",
			version = "2.*",
			config = function()
				require("window-picker").setup()
			end,
		},
	},
})
