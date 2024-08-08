-- https://github.com/stevearc/conform.nvim

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = nil,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" }, "eslint_d" },
				html = { { "prettierd", "prettier" }, "eslint_d", "stylelint" },
				typescript = { { "prettierd", "prettier" }, "eslint_d" },
				svelte = { { "prettierd", "prettier" }, "eslint_d" },
				markdown = { { "prettierd", "prettier" } },
				css = { "stylelint", { "prettierd", "prettier" } },
			},
		})

		local formatBufferOrSelection = function()
			local formatters = conform.list_formatters()
			conform.format({
				async = true,
				lsp_fallback = "fallback",
				formatters,
			}, function(_, did_edit)
				if did_edit then
					local formatter_names = {}
					for _, formatter in ipairs(formatters) do
						formatter_names[#formatter_names + 1] = formatter.name
					end
					vim.notify("[Conform] Formatted using " .. table.concat(formatter_names, ", "))
				end
			end)
		end

		vim.keymap.set("n", "<leader>ff", formatBufferOrSelection, { desc = "Conform: [f]ormat whole [f]ile" })
		vim.keymap.set("v", "<leader>f", formatBufferOrSelection, { desc = "Conform: [f]ormat selection" })
	end,
}

