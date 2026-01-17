local utils = require("vnphanquang.utils")
local eco = require("vnphanquang.lsp.ecosystem.utils")

return eco.define_lsp_tools({
	{
		mason_id = 'denols',
		config = {
			root_dir = function(bufnr, on_dir)
				local deno_root = utils.get_deno_root(bufnr)
				if deno_root then on_dir(deno_root) end
			end,
		}
	},
	"eslint-lsp",
	"eslint_d",
	"js-debug-adapter", -- used in conjunction with nvim-dap, see `dap.lua`
	{
		mason_id = 'stylelint-lsp',
		config = {
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, function(filename)
					return filename:match("^.prettierc") or filename:match("^prettier.config")
				end)
				if root then on_dir(root) end
			end,
		}
	},
	{
		mason_id = 'stylelint-lsp',
		config = {
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, function(filename)
					return filename:match("^.prettierc") or filename:match("^prettier.config")
				end)
				if root then on_dir(root) end
			end,
		}
	},
	{
		mason_id = 'svelte',
		config = {
			on_attach = function(client)
				-- https://github.com/sveltejs/language-tools/issues/2008
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						-- Here use ctx.match instead of ctx.file
						---@diagnostic disable-next-line: param-type-mismatch
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		}
	},
	"tailwindcss",
	{
		mason_id = 'ts_ls',
		config = {
			root_dir = function(bufnr, on_dir)
				local deno_root = utils.get_deno_root(bufnr)
				if not deno_root then
					local root = vim.fs.root(bufnr, { 'package.json', 'tsconfig.json', 'jsconfig.json', 'tsconfig.jsonc' })
					if root then on_dir(root) end
				end
			end,
		}
	},
})
