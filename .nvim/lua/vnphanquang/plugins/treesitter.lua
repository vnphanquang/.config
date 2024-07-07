-- https://github.com/nvim-treesitter/nvim-treesitter
return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		-- Prefer git instead of curl in order to improve connectivity in some environments
		require('nvim-treesitter.install').prefer_git = true

		---@diagnostic disable-next-line: missing-fields
		require('nvim-treesitter.configs').setup({
			-- A list of parser names, or "all"
			ensure_installed = {
					'html', 'css', 'svelte', 'scss',
					'javascript', 'jsdoc', 'typescript',
					'lua', 'luadoc',
					'rust',
					'diff',
					'markdown',
					'bash',
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
			},
		})
	end
}

