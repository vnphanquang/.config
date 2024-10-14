return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("notify").setup({
			top_down = false,
		})
		require("noice").setup()
		vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<cr>", { desc = "Telescope: [s]search [n]otifications" })
	end,
}

