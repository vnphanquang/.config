-- https://github.com/rcarriga/nvim-notify
return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		---@diagnostic disable-next-line: missing-fields
		notify.setup({
			timeout = 3000,
			top_down = false,
		})
		vim.notify = notify
		vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<cr>", { desc = "Telescope: [s]search [n]otifications" })
	end,
}

