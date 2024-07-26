return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({})
		vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<cr>", { desc = "Telescope: [s]search [n]otifications" })
	end,
}

