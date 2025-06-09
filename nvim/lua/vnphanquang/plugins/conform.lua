-- https://github.com/stevearc/conform.nvim

return {
	"stevearc/conform.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	-- event = { "BufWritePre" },
	-- cmd = { "ConformInfo" },
	config = function()
		local __unpack__ = table.unpack or unpack -- lua 5.1 compatibility

		local conform = require("conform")
		local lspconfig = require("lspconfig")

		---@param bufnr integer
		---@param ... string
		---@return string
		local function first(bufnr, ...)
			for i = 1, select("#", ...) do
				local formatter = select(i, ...)
				if conform.get_formatter_info(formatter, bufnr).available then
					return formatter
				end
			end
			return select(1, ...)
		end

		local function is_deno_project(bufnr)
			return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.api.nvim_buf_get_name(bufnr))
		end

		local function first_prettier_fmt(bufnr)
			return { first(bufnr, "prettierd", "prettier") }
		end

		local function html_css(bufnr)
			if is_deno_project(bufnr) then
				return { "deno_fmt", "stylelint" }
			end

			return { __unpack__(first_prettier_fmt(bufnr)), "stylelint" }
		end

		local function js_fmts(bufnr)
			if is_deno_project(bufnr) then
				return { "deno_fmt" }
			end

			return { __unpack__(first_prettier_fmt(bufnr)), first(bufnr, "eslint_d", "eslint") }
		end

		local function yaml_fmts(bufnr)
			if is_deno_project(bufnr) then
				return { "deno_fmt" }
			end

			return { first(bufnr, "prettierd", "prettier", "yamlfix") }
		end

		conform.setup({
			format_on_save = nil,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = js_fmts,
				typescript = js_fmts,
				json = js_fmts,
				jsonc = js_fmts,
				svelte = js_fmts,
				html = html_css,
				css = html_css,
				markdown = function(bufnr)
					if is_deno_project(bufnr) then
						return { "deno_fmt" }
					end
					return first_prettier_fmt(bufnr)
				end,
				python = {
					-- To fix auto-fixable lint errors.
					"ruff_fix",
					-- To run the Ruff formatter.
					"ruff_format",
					-- To organize the imports.
					"ruff_organize_imports",
				},
				yaml = yaml_fmts,
				rust = { "rustfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
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
