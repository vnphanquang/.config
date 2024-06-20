-- https://github.com/nvim-lualine/lualine.nvim
return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('lualine').setup({})
		vim.opt.showmode = false
	end,
}

