vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>te", vim.diagnostic.open_float, { desc = "show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>tq", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })
