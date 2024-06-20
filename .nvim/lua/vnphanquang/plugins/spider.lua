-- https://github.com/chrisgrieser/nvim-spider
return {
	"chrisgrieser/nvim-spider",
	config = function()
		require("spider").setup()
		vim.keymap.set({ "n", "o", "x" }, "<leader>w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider: w" })
		vim.keymap.set({ "n", "o", "x" }, "<leader>e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider: e" })
		vim.keymap.set({ "n", "o", "x" }, "<leader>b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider: b" })
	end,
}

