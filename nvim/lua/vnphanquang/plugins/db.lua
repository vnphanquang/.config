vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dbout" },
	callback = function()
		vim.cmd("normal! zR")
	end,
})

return {
	-- {
	-- 	"kndndrj/nvim-dbee",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	build = function()
	-- 		require("dbee").install()
	-- 	end,
	-- 	config = function()
	-- 		local dbee = require("dbee")
	-- 		-- default at https://github.com/kndndrj/nvim-dbee/blob/master/lua/dbee/config.lua
	-- 		dbee.setup({})
	-- 		vim.keymap.set("n", "<leader><leader>db", dbee.toggle, { desc = "toggle interactive [d]ata[b]ase client" })
	-- 	end,
	-- },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "sqlite", "mariadb" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
