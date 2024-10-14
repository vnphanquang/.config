-- https://github.com/folke/trouble.nvim

return {
	'folke/trouble.nvim',
	config = function()
		local trouble = require('trouble')
		trouble.setup({})

		-- keybindings
		vim.keymap.set('n', '<leader>tt', '<cmd>Trouble diagnostics toggle focus=true<cr>', { desc = 'Toggle diagnostics' })

	end,
}
