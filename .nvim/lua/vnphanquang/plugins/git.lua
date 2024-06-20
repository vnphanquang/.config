return {
	-- https://github.com/lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				on_attach = function(bufnr)
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>hw", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end, { desc = "GitSigns: go to next hunk" })

					map("n", "<leader>hb", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end, { desc = "GitSigns: go to previous hunk" })

					-- Actions
					-- git add
					map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "GitSigns: git add hunk" })
					map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "GitSigns: git add buffer" })
					map("v", "<leader>hs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "GitSigns: git add selected hunk(s)" })

					-- git reset
					map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "GitSigns: git reset hunk" })
					map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "GitSigns: git reset buffer" })
					map("v", "<leader>hr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "GitSigns: git reset selected hunk(s)" })

					-- blame line
					map("n", "<leader>hl", gitsigns.toggle_current_line_blame, { desc = "Gitsigns: toggle current line blame" })
					map("n", "<leader>hL", function()
						gitsigns.blame_line({ full = true })
					end, { desc = "GitSigns: blame line" })

					map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "GitSigns: undo hunk staging" })
					map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "GitSigns: preview hunk" })
					map("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns: diff this buffer" })
					map("n", "<leader>hx", gitsigns.toggle_deleted, { desc = "Gitsigns: toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})

			-- Shortuct for git
			vim.keymap.set(
				"n",
				"<leader>sgb",
				"<cmd>Telescope git_branches<cr>",
				{ desc = "Telescope: [s]earch [g]it [b]ranches" }
			)
			vim.keymap.set(
				"n",
				"<leader>sgs",
				"<cmd>Telescope git_status<cr>",
				{ desc = "Telescope: [s]earch [g]it [s]tatus" }
			)
			vim.keymap.set("n", "<leader>sgt", "<cmd>Telescope git_stash<cr>", { desc = "Telescope: [s]earch [g]it [t]ash" })
			vim.keymap.set(
				"n",
				"<leader>sgc",
				"<cmd>Telescope git_commits<cr>",
				{ desc = "Telescope: [s]earch [g]it [c]ommits" }
			)
		end,
	},
	-- https://github.com/tpope/vim-fugitive
	{
		"tpope/vim-fugitive",
	},
}

