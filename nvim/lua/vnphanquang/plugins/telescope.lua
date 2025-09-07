-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		not vim.fn.has("win32") and { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } or {},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		-- "jonarrien/telescope-cmdline.nvim",
		"debugloop/telescope-undo.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					".vscode/.*",
					"yarn.lock",
					"package%-lock.json",
					"pnpm%-lock.yaml",
					"lazy%-lock.json",
					".git/.*",
				},
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		telescope.load_extension("ui-select")
		telescope.load_extension("live_grep_args")
		if not vim.fn.has("win32") then
			telescope.load_extension("fzf")
		end

		-- enhance command line
		-- pcall(telescope.load_extension, "cmdline")
		-- vim.keymap.set({ "n", "v" }, ":", "<cmd>Telescope cmdline<cr>", { desc = "Telescope: Cmdline" })

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, { desc = "Telescope: [s]earch [s]pelling suggestions" })
		vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Telescope: [s]earch [q]uickfix" })
		vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Telescope: [s]earch [c]ommands" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope: [s]earch [h]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope: [s]earch [k]eymaps" })

		-- We cache the results of "git rev-parse"
		-- Process creation is expensive in Windows, so this reduces latency
		local is_inside_work_tree = {}
		vim.keymap.set("n", "<leader>sf", function()
			local opts = {
				show_untracked = true,
				use_git_root = true,
			}

			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				builtin.git_files(opts)
			else
				builtin.find_files(opts)
			end
		end, { desc = "Telescope: [s]earch [F]iles" })

		vim.keymap.set("n", "<leader>sw", function()
			builtin.grep_string({
				search = vim.fn.expand("<cword>"),
				additional_args = {
					"--hidden",
				},
			})
		end, { desc = "Telescope: [s]earch current [w]ord" })

		vim.keymap.set("n", "<leader>sp", function()
			-- Live grep from project git root with fallback
			local function is_git_repo()
				vim.fn.system("git rev-parse --is-inside-work-tree")

				return vim.v.shell_error == 0
			end

			local function get_git_root()
				local dot_git_path = vim.fn.finddir(".git", ".;")
				return vim.fn.fnamemodify(dot_git_path, ":h")
			end

			local opts = {}

			if is_git_repo() then
				opts = {
					cwd = get_git_root(),
					additional_args = {
						"--hidden",
					},
				}
			end

			telescope.extensions.live_grep_args.live_grep_args(opts)
		end, { desc = "Telescope: [s]earch by grep [p]roject-wide" })

		vim.keymap.set("n", "<leader>sP", function()
			telescope.extensions.live_grep_args.live_grep_args({
				additional_args = {
					"--hidden",
				},
			})
		end, { desc = "Telescope: [s]earch by grep folder-wide (no git, include hidden)" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Telescope: [s]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope: [s]earch [d]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Telescope: [s]earch [r]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Telescope: [s]earch Recent Files ([.] for repeat)" })
		vim.keymap.set("n", "<leader>s<leader>", builtin.builtin, { desc = "Telescope: [s]earch [s]elect Telescope" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope: [s]earch existing [b]uffers" })
		vim.keymap.set("n", "<leader>se", builtin.registers, { desc = "Telescope: [s]earch in r[e]gisters" })

		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Telescope: [/] fuzzily search in current buffer" })

		-- Shortcut for searching Neovim configuration files
		vim.keymap.set("n", "<leader>sv", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Telescope: [s]earch neo[v]im files" })

		telescope.load_extension("undo")
		vim.keymap.set("n", "<leader>su", telescope.extensions.undo.undo, { desc = "Telescope: [s]earch [u]ndos" })
	end,
}
