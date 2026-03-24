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

					map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "GitSigns: preview hunk" })
					map("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns: diff this buffer" })
					map("n", "<leader>hx", gitsigns.preview_hunk_inline, { desc = "Gitsigns: toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},
	-- https://github.com/aaronhallaert/advanced-git-search.nvim
	{
		"aaronhallaert/advanced-git-search.nvim",
		lazy = false,
		cmd = { "AdvancedGitSearch" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
		},
		config = function()
			-- Shortcuts for git
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sgb", builtin.git_branches, { desc = "Telescope: [s]earch [g]it [b]ranches" })
			vim.keymap.set("n", "<leader>sgs", builtin.git_status, { desc = "Telescope: [s]earch [g]it [s]tatus" })
			vim.keymap.set("n", "<leader>sgc", builtin.git_commits, { desc = "Telescope: [s]earch [g]it [c]ommits" })

			require("telescope").load_extension("advanced_git_search")
			vim.keymap.set(
				"n",
				"<leader>sgl",
				"<cmd>AdvancedGitSearch search_log_content<CR>",
				{ desc = "Telescope: [s]earch [g]it log content" }
			)
			vim.keymap.set(
				"n",
				"<leader>sgL",
				"<cmd>AdvancedGitSearch search_log_content_file<CR>",
				{ desc = "Telescope: [s]earch [g]it log with current [F]ile" }
			)
			vim.keymap.set(
				"n",
				"<leader>sgdf",
				"<cmd>AdvancedGitSearch diff_commit_file<CR>",
				{ desc = "Telescope: [s]earch [g]it diff with current [f]ile" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>sgdl",
				"<cmd>AdvancedGitSearch diff_commit_line<CR>",
				{ desc = "Telescope: [s]earch [g]it diff with current [l]ine" }
			)
			vim.keymap.set(
				"n",
				"<leader>sgdb",
				"<cmd>AdvancedGitSearch changed_on_branch<CR>",
				{ desc = "Telescope: [s]earch [g]it diff with current [b]ranch" }
			)
			vim.keymap.set(
				"n",
				"<leader>sgr",
				"<cmd>AdvancedGitSearch checkout_reflog<CR>",
				{ desc = "Telescope: [s]earch and checkout from [g]it [r]eflog" }
			)
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		config = function()
			local diffview = require("diffview")

			diffview.setup({
				view = {
					-- Default view for all diffviews
					default = {
						layout = "diff2_horizontal",
						winbar_info = true,
					},
				},
				-- You can use the 'hooks' to manipulate the window after it opens
				hooks = {
					view_opened = function(view)
						-- Code to make the window float if not using native float options
					end,
				},
			})

			vim.keymap.set("n", "<leader>gd", function()
				diffview.open({ type = "float" })
			end, { desc = "Open DiffView" })

			vim.keymap.set(
				"n",
				"<leader>gh",
				"<cmd>DiffviewFileHistory<CR>",
				{ desc = "Open DiffviewFileHistory for current file" }
			)
			vim.keymap.set(
				"v",
				"<leader>gh",
				"<cmd>'<,'>DiffviewFileHistory<CR>",
				{ desc = "Open DiffviewFileHistory for current visual selection" }
			)
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"pabloariasal/webify.nvim",
			"rbong/vim-flog",
		},
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				cmd = "Neogit",
				integrations = {
					telescope = true,
					diffview = true,
				},
				graph_style = "unicode",
			})

			-- Git Status
			vim.keymap.set("n", "<leader>gg", function()
				neogit.open({ kind = "floating" })
			end, { desc = "Open Neogit UI" })
			vim.keymap.set("n", "<leader>g|", function()
				neogit.open({ kind = "vsplit" })
			end, { desc = "Open Neogit UI, split right" })
			vim.keymap.set("n", "<leader>g-", function()
				neogit.open({ kind = "split_below_all" })
			end, { desc = "Open Neogit UI, split below" })

			-- Open in Github / copy URL (call pabloariasal/webify.nvim)
			vim.keymap.set("n", "<leader>go", "<cmd>OpenFileInRepo<cr>", { desc = "Open in web browser" })
			vim.keymap.set(
				"n",
				"<leader>gO",
				"<cmd>OpenLineInRepo<cr>",
				{ desc = "Open in web browser, including current line" }
			)
			vim.keymap.set("n", "<leader>gy", "<cmd>YankFileUrl +<cr>", { desc = "Yank Url to system clipboard" })
			vim.keymap.set(
				"n",
				"<leader>gY",
				"<cmd>YankLineUrl +<cr>",
				{ desc = "Yank Url to system clipboard, including current line" }
			)
		end,
	},
}
