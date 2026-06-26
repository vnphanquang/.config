return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local notify = require("notify")
		---@diagnostic disable-next-line: missing-fields
		notify.setup({
			top_down = false,
			notify = {
				enabled = true,
				view = "notify",
			},
		})
		vim.notify = notify

		require("noice").setup()
		vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<cr>", { desc = "Telescope: [s]search [n]otifications" })
	end,
}
