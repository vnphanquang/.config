-- https://github.com/smoka7/hop.nvim
return {
	'smoka7/hop.nvim',
	config = function()
		local hop = require('hop')
		hop.setup()

		local directions = require('hop.hint').HintDirection

		-- on current line
		vim.keymap.set('', 'f', function()
			hop.hint_char1({
				direction = directions.AFTER_CURSOR,
				current_line_only = true,
			})
		end, {
			remap = true,
			desc = 'Hop: onto character [f]ound after cursor on current line'
		})
		vim.keymap.set('', 'F', function()
			hop.hint_char1({
				direction = directions.BEFORE_CURSOR,
				current_line_only = true,
			})
		end, {
			remap = true,
			desc = 'Hop: onto character [F]ound before cursor on current line'
		})
		vim.keymap.set('', 't', function()
			hop.hint_char1({
				direction = directions.AFTER_CURSOR,
				current_line_only = true,
				hint_offset = -1,
			})
		end, {
			remap = true,
			desc = 'Hop: [t]ill character after cursor on current line'
		})
		vim.keymap.set('', 'T', function()
			hop.hint_char1({
				direction = directions.BEFORE_CURSOR,
				current_line_only = true,
				hint_offset = 1,
			})
		end, {
			remap = true,
			desc = 'Ho [T]ill character before cursor on current line'
		})

		-- word
		vim.keymap.set('', '<leader><leader>w', function()
			hop.hint_words({
				direction = directions.AFTER_CURSOR,
				current_line_only = false,
			})
		end, {
			remap = true,
			desc = 'Hop: to [w]ord after cursor'
		})
		vim.keymap.set('', '<leader><leader>b', function()
			hop.hint_words({
				direction = directions.BEFORE_CURSOR,
				current_line_only = false,
			})
		end, {
			remap = true,
			desc = 'Hop: to word [b]efore cursor'
		})

		-- search
		vim.keymap.set('', '<leader><leader>s', function()
			hop.hint_char2({})
		end, {
			remap = true,
			desc = 'Hop:earch and hop to pattern by 2 characters'
		})
	end
}

