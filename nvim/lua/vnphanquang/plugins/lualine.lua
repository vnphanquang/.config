-- https://github.com/nvim-lualine/lualine.nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local function spell()
			if vim.wo.spell == true then -- Note that 'spell' is a window option, so: wo
				return 'spell: ' .. vim.bo.spelllang
			end
			return ''
		end

		require("lualine").setup({
			sections = {
				lualine_x = { spell, "require('wrapping').get_current_mode()", "encoding", "fileformat", "filetype" },
			},
		})
		vim.opt.showmode = false
	end,
}

