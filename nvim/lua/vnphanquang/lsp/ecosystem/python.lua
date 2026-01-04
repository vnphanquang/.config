local eco = require("vnphanquang.lsp.ecosystem.utils")

return eco.define_lsp_tools({
	{
		mason_id = "ruff",
		unsupported_os = { "Windows" },
		on_attach = function(client)
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	},
	{
		mason_id = "pyright",
		config = {
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						ignore = { "*" },
					},
				},
			},
		}
	}
})
