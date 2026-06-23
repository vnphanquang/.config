-- https://github.com/nvim-mini/mini.nvim
return {
	{
		"nvim-mini/mini.ai",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
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
		"nvim-mini/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup({
				symbol = "│",
			})
		end,
	},
	{
		"nvim-mini/mini.comment",
		version = "*",
		config = function()
			require("mini.comment").setup({})
		end,
	},
	{
		"nvim-mini/mini.operators",
		version = "*",
		config = function()
			vim.keymap.del("n", "grt")
			require("mini.operators").setup({
				-- Evaluate text and replace with output
				evaluate = {
					prefix = "ge",
				},
			})
		end,
	},
	{
		"nvim-mini/mini.pairs",
		version = "*",
		dependencies = {
			"windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
		},
		config = function()
			require("nvim-ts-autotag").setup()
			require("mini.pairs").setup({})
		end,
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		config = function()
			vim.keymap.set("n", "s", "<nop>", { noremap = true, silent = true })
			require("mini.surround").setup({})
		end,
	},
}
