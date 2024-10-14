-- TODO: testing todo comments
-- https://github.com/folke/todo-comments.nvim
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			signs = false,
		})

		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Telescope: [t]odo [t]ags" })
	end,
}

