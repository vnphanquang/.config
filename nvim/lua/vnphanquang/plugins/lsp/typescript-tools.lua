-- https://github.com/pmizio/typescript-tools.nvim
--
return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		single_file_support = false,
		root_dir = function(filename)
			local lspconfig = require("lspconfig")
			local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(filename)
			if denoRootDir then
				return nil
			end
			return lspconfig.util.root_pattern("package.json")(filename)
		end,
	},
}

