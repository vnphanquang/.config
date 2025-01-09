require("vnphanquang.options")
require("vnphanquang.keybindings")
require("vnphanquang.lazy")
require("vnphanquang.ibus")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Add new line to the end of the file
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	group = vim.api.nvim_create_augroup("UserOnSave", {}),
-- 	pattern = "*",
-- 	callback = function()
-- 		local insert_final_newline = vim.b.editorconfig.insert_final_newline
-- 		-- vim.notify("Insert final newline: " .. insert_final_newline)
-- 		if insert_final_newline ~= 'false' then
-- 			local n_lines = vim.api.nvim_buf_line_count(0)
-- 			local last_nonblank = vim.fn.prevnonblank(n_lines)
-- 			if last_nonblank <= n_lines then
-- 				pcall(vim.cmd, [[undojoin]])
-- 				-- vim.cmd([[undojoin]])
-- 				vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { "" })
-- 			end
-- 		end
-- 	end,
-- })

vim.filetype.add({
	pattern = {
		[".*.md.svelte"] = "markdown",
		[".denoflare"] = "jsonc"
	},
})

vim.keymap.set('n', '<Leader><C-b>',
  function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buflist) do
      if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
        vim.cmd('bd ' .. tostring(bufnr))
      end
    end
  end, { silent = true, desc = 'Close unused buffers' })

