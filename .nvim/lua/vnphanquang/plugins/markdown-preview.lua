-- https://github.com/iamcco/markdown-preview.nvim
return {
	'iamcco/markdown-preview.nvim',
	cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
	ft = { 'markdown' },
	build = function() vim.fn['mkdp#util#install']() end,
	init = function()
		vim.cmd(
			[[
function OpenMarkdownPreview (url)
	execute "silent ! firefox --new-window " . a:url
endfunction
]]
		)

		vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
	end
}

-- https://github.com/toppair/peek.nvim
-- return {
-- 	'toppair/peek.nvim',
-- 	event = { 'VeryLazy' },
-- 	build = 'deno task --quiet build:fast',
-- 	config = function()
-- 		require('peek').setup()
-- 		vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
-- 		vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
-- 	end,
-- }
