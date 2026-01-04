local eco = require("vnphanquang.lsp.ecosystem.utils")

return eco.define_lsp_tools({
	{
		mason_id = "lua_ls",
		config = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				diagnostics = {
					-- disable = { 'missing-fields' }
					globals = { "vim" },
				},
			},
		},
		plugins = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				config = function()
					require("lazydev").setup({})
				end,
			},
		},
	},
	"stylua"
})
