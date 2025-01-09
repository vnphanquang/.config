return {
	-- https://github.com/chrisgrieser/nvim-various-textobjs
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({
				useDefaultKeymaps = false,
			})
			vim.keymap.set({ "o", "x" }, "a<leader>w", '<cmd>lua require("various-textobjs").subword("outer")<CR>', { desc = "VariousTextObjs: Subword (outer)" })
			vim.keymap.set({ "o", "x" }, "i<leader>w", '<cmd>lua require("various-textobjs").subword("inner")<CR>', { desc = "VariousTextObjs: Subword (inner)" })
		end,
	},
	-- https://github.com/chrisgrieser/nvim-spider
	{
		"chrisgrieser/nvim-spider",
		config = function()
			require("spider").setup()
			vim.keymap.set(
				{ "n", "o", "x" },
				"<leader>w",
				"<cmd>lua require('spider').motion('w')<CR>",
				{ desc = "Spider: w" }
			)
			vim.keymap.set(
				{ "n", "o", "x" },
				"<leader>e",
				"<cmd>lua require('spider').motion('e')<CR>",
				{ desc = "Spider: e" }
			)
			vim.keymap.set(
				{ "n", "o", "x" },
				"<leader>b",
				"<cmd>lua require('spider').motion('b')<CR>",
				{ desc = "Spider: b" }
			)
		end,
	},
}
