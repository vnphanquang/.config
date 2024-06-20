-- https://github.com/gbprod/substitute.nvim
--
return {
	'gbprod/substitute.nvim',
	config = function()
		require('substitute').setup({})

		vim.keymap.set('n', 's', require('substitute').operator, { noremap = true, desc = '[s]ubstitute, followed by motion' })
		vim.keymap.set('n', 'ss', require('substitute').line, { noremap = true, desc = '[s]ubstitute lines' })
		vim.keymap.set('n', 'S', require('substitute').eol, { noremap = true, desc = '[s]ubstitute till EOL' })
		vim.keymap.set('x', 's', require('substitute').visual, { noremap = true, desc = '[s]ubstitute in visual mode' })
	end,
}
