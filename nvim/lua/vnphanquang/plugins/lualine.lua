-- https://github.com/nvim-lualine/lualine.nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local function spell()
			if vim.wo.spell == true then -- Note that 'spell' is a window option, so: wo
				return "spell: " .. vim.bo.spelllang
			end
			return ""
		end

		require("lualine").setup({
			sections = {
				lualine_b = {
					{ "filename", path = 4 },
					'diagnostics',
					-- {
					-- 	function()
					-- 		return " "
					-- 	end,
					-- 	color = function()
					-- 		local status = require("sidekick.status").get()
					-- 		if status then
					-- 			return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
					-- 		end
					-- 	end,
					-- 	cond = function()
					-- 		local status = require("sidekick.status")
					-- 		return status.get() ~= nil
					-- 	end,
					-- },
				},
				lualine_c = {
					'branch',
					'diff',
				},
				lualine_x = {
					-- {
					-- 	function()
					-- 		local status = require("sidekick.status").cli()
					-- 		return " " .. (#status > 1 and #status or "")
					-- 	end,
					-- 	cond = function()
					-- 		return #require("sidekick.status").cli() > 0
					-- 	end,
					-- 	color = function()
					-- 		return "Special"
					-- 	end,
					-- },
					spell,
					"require('wrapping').get_current_mode()",
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
		vim.opt.showmode = false
	end,
}
