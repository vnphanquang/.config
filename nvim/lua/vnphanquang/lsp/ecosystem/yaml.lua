local eco = require("vnphanquang.lsp.ecosystem.utils")
return eco.define_lsp_tools({
	mason_id = 'yamlls',
	unsupported_os = { "Windows" }
})
