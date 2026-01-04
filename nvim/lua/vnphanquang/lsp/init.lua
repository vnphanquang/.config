require("vnphanquang.lsp.autocmd")
local utils = require("vnphanquang.utils")
local ecosystem = require("vnphanquang.lsp.ecosystem")

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			ecosystem.config()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = ecosystem.mason_ids,
			})
		end,
	},
	utils.unpack(ecosystem.plugins),
	utils.unpack(require("vnphanquang.lsp.completion")),
}
