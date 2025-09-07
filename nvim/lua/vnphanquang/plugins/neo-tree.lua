-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"MunifTanjim/nui.nvim",
		not vim.fn.has("win32") and "3rd/image.nvim" or {},
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		if not vim.fn.has("win32") then
			require("image").setup({
				backend = "ueberzug",
			})
		end
		require("neo-tree").setup({
			filesystem = {
				window = {
					mappings = {
						["\\"] = "close_window",
					},
				},
			},
			git_status = {
				window = {
					mappings = {
						["gg"] = "none",
					},
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt_local.number = true
						vim.opt_local.relativenumber = true
					end,
				},
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd('Neotree close')
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = "Toggle NeoTree" })
	end,
}
