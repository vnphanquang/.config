-- https://github.com/stevearc/conform.nvim

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = nil,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
			},
		})

		local formatBufferOrSelection = function()
			local formatters = conform.list_formatters()
			conform.format({
				async = true,
				lsp_fallback = 'fallback',
				formatters,
			}, function(_, did_edit)
				if did_edit then
					vim.notify('[Conform] Formatted using "' .. formatters[1].name .. '"')
				end
			end)
		end

		vim.keymap.set('n', '<leader>ff', formatBufferOrSelection, { desc = 'Conform: [f]ormat whole [f]ile' })
		vim.keymap.set('v', '<leader>f', formatBufferOrSelection, { desc = 'Conform: [f]ormat selection' })
	end,
}

