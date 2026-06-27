local languages = {
	"bash",
	"css",
	"diff",
	"dockerfile",
	"fish",
	"gitignore",
	"graphql",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"scss",
	"sql",
	"svelte",
	"toml",
	"typescript",
	"vim",
	"yaml",
	"zig",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "mysql", "postgres", "mariadb", "sqlite" },
	callback = function()
		vim.bo.commentstring = "-- %s"
	end,
})

return {
	{ -- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
		},
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup({})
			treesitter.install(languages)
		end,
	},
}
