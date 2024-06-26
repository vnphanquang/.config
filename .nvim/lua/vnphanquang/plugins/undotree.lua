-- https://github.com/jiaoshijie/undotree
return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("undotree").setup({
			window = {
				winblend = 0,
			},
		})
		vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Undotree: toggle" });
		vim.opt.undofile = true
	end,
}

