local eco = require("vnphanquang.lsp.ecosystem.utils")

return eco.define_lsp_ecosystem({
	require('vnphanquang.lsp.ecosystem.docker'),
	require('vnphanquang.lsp.ecosystem.javascript'),
	require('vnphanquang.lsp.ecosystem.lua'),
	require('vnphanquang.lsp.ecosystem.markdown'),
	require('vnphanquang.lsp.ecosystem.python'),
	require('vnphanquang.lsp.ecosystem.rust'),
	require('vnphanquang.lsp.ecosystem.shell'),
	require('vnphanquang.lsp.ecosystem.sql'),
	require('vnphanquang.lsp.ecosystem.yaml'),
})
