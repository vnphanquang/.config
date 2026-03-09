require("vnphanquang.options")
require("vnphanquang.keybindings")
require("vnphanquang.lazy")
require("vnphanquang.diagnostics")
-- require("vnphanquang.ibus")

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
		[".*.mjml"] = "html",
		[".*.md.svelte"] = "markdown",
		[".denoflare"] = "jsonc",
		[".env.*"] = "sh",
	},
})

vim.keymap.set("n", "<Leader><C-b>", function()
	local curbufnr = vim.api.nvim_get_current_buf()
	local buflist = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buflist) do
		if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
			vim.cmd("bd " .. tostring(bufnr))
		end
	end
end, { silent = true, desc = "Close unused buffers" })

--

vim.keymap.set(
	"n",
	"<leader>ybn",
	'<cmd>let @+=expand("%:t")<CR>',
	{ desc = "yank filename of current buffer, relative to cwd" }
)
vim.keymap.set(
	"n",
	"<leader>yba",
	'<cmd>let @+=expand("%:p")<CR>',
	{ desc = "yank absolute filepath of current buffer" }
)
function CopyPathRelativeToGitRoot()
	-- Get the current buffer's absolute path
	local file_path = vim.fn.expand("%:p")

	-- Find the git repository root directory
	local git_root = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")

	if git_root == '.' then
		vim.notify("Not inside a git repository!", vim.log.levels.ERROR)
		return
	end

	-- Calculate the relative path
	-- string.len(git_root) + 2 accounts for the length and the trailing slash
	local relative_path = string.sub(file_path, string.len(git_root) + 2)

	-- Copy the relative path to the clipboard register (+)
	vim.fn.setreg("+", relative_path)
end
vim.api.nvim_create_user_command("CopyBufferPathGit", CopyPathRelativeToGitRoot, {})
vim.keymap.set(
	"n",
	"<leader>ybg",
	"<cmd>:CopyBufferPathGit<CR>",
	{ desc = "yank filepath of current buffer, relative to git root (if any)" }
)

-- TODO: add https://github.com/kiyoon/telescope-insert-path.nvim?
