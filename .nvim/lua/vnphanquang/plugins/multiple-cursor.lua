-- https://github.com/brenton-leighton/multiple-cursors.nvim
return {
	'brenton-leighton/multiple-cursors.nvim',
	version = "*",  -- Use the latest tagged version
	opts = {},  -- This causes the plugin setup function to be called
	keys = {
		{'<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = {'n', 'i', 'x'}, desc = 'Add cursor and move up'},
		{'<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = {'n', 'i', 'x'}, desc = 'Add cursor and move down'},

		{'<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = {'n', 'i'}, desc = 'Add or remove cursor'},

		{'<C-k>', "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
	},
}
