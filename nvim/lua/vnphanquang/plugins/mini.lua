-- https://github.com/echasnovski/mini.nvim
return {
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			local spec_treesitter = require("mini.ai").gen_spec.treesitter
			require("mini.ai").setup({
				n_lines = 200,
				custom_textobjects = {
					f = spec_treesitter({
						a = {
							"@function.outer",
						},
						i = {
							"@function.inner",
						},
					}),
					F = spec_treesitter({
						a = {
							"@call.outer",
						},
						i = {
							"@call.inner",
						},
					}),
					i = spec_treesitter({
						a = {
							"@conditional.outer",
						},
						i = {
							"@conditional.inner",
						},
					}),
					d = spec_treesitter({
						a = {
							"@svelte.directive.outer",
						},
						i = {
							"@svelte.directive.inner",
						},
					}),
					a = spec_treesitter({
						a = {
							"@parameter.outer",
							"@attribute.outer",
						},
						i = {
							"@parameter.inner",
							"@attribute.inner",
						},
					}),
					c = spec_treesitter({
						a = {
							"@comment.outer",
						},
						i = {
							"@comment.outer",
						},
					}),
					C = spec_treesitter({
						a = {
							"@class.outer",
						},
						i = {
							"@class.inner",
						},
					}),
					e = spec_treesitter({
						a = {
							"@loop.outer",
						},
						i = {
							"@loop.inner",
						},
					}),
					r = false,
					j = spec_treesitter({
						a = {
							"@svelte.block.outer",
						},
						i = {
							"@svelte.block.inner",
						},
					}),
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			vim.keymap.set("n", "s", "<nop>", { noremap = true, silent = true })
			require("mini.surround").setup({})
		end,
	},
	{
		"echasnovski/mini.operators",
		version = "*",
		config = function()
			require("mini.operators").setup({
				-- Evaluate text and replace with output
				evaluate = {
					prefix = "ge",
				},
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		dependencies = {
			"windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
		},
		config = function()
			require("mini.pairs").setup({})
			require("nvim-ts-autotag").setup()
		end,
	},
}
