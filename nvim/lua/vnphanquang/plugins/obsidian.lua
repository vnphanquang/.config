return {
	"obsidian-nvim/obsidian.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"OXY2DEV/markview.nvim",
	},
	version = "*", -- recommended, use latest release instead of latest commit

	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	-- 	"BufReadPre " .. vim.fn.expand("~") .. "/obsidian/*.md",
	-- 	"BufNewFile " .. vim.fn.expand("~") .. "/obsidian/*.md",
	-- },

	config = function()
		local obsidian = require("obsidian")
		obsidian.setup({
			legacy_commands = false,
			workspaces = {
				{
					name = "vnphanquang",
					path = "~/obsidian/vnphanquang",
				},
			},
			picker = {
				name = "telescope.nvim",
			},
		})

		-- augment telescope mapping
		vim.keymap.set("n", "<leader>sof", function()
			obsidian.Picker.find_notes()
		end, { desc = "Telescope: [s]earch [o]bsidian notes by [f]ilename" })
		vim.keymap.set("n", "<leader>sop", function()
			obsidian.Picker.grep_notes()
		end, { desc = "Telescope: [s]earch [o]bsidian notes with gre[p]" })
	end,
}
