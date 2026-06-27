local utils = require("vnphanquang.utils")
local eco = require("vnphanquang.lsp.ecosystem.utils")

return eco.define_lsp_tools({
	{
		mason_id = "denols",
		config = {
			root_dir = function(bufnr, on_dir)
				local deno_root = utils.get_deno_root(bufnr)
				if deno_root then
					on_dir(deno_root)
				end
			end,
		},
	},
	"eslint-lsp",
	"eslint_d",
	"js-debug-adapter", -- used in conjunction with nvim-dap, see `dap.lua`
	{
		mason_id = "stylelint_lsp",
		config = {
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, function(filename)
					return filename:match("^.prettierc") or filename:match("^prettier.config")
				end)
				if root then
					on_dir(root)
				end
			end,
		},
	},
	{
		mason_id = "stylelint_lsp",
		config = {
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, function(filename)
					return filename:match("^.prettierc") or filename:match("^prettier.config")
				end)
				if root then
					on_dir(root)
				end
			end,
		},
	},
	"svelte",
	{
		mason_id = "tailwindcss",
		config = {
			settings = {
				tailwindCSS = {
					classFunctions = { "tw", "clsx" },
				},
			},
		},
	},
	{
		mason_id = "ts_ls",
		config = {
			root_dir = function(bufnr, on_dir)
				local deno_root = utils.get_deno_root(bufnr)
				if not deno_root then
					local root = vim.fs.root(bufnr, { "package.json", "tsconfig.json", "jsconfig.json", "tsconfig.jsonc" })
					if root then
						on_dir(root)
					end
				end
			end,
		},
	},
	"emmet-language-server",
})
