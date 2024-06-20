-- https://github.com/nvim-lualine/lualine.nvim
return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('lualine').setup({
			sections = {
				lualine_b = { 'branch', 'b:gitsigns_status', 'diff', 'diagnostics' }
			}
		})
		vim.opt.showmode = false
	end,
}

