return {
	{ -- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"gitignore",
					"graphql",
					"html",
					"css",
					"svelte",
					"scss",
					"javascript",
					"jsdoc",
					"typescript",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"vim",
					"rust",
					"diff",
					"markdown",
					"markdown_inline",
					"bash",
					"dockerfile",
					"python",
					"yaml",
					"toml"
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
				auto_install = false,

				indent = {
					enable = true,
				},

				highlight = {
					enable = true,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>ti",
						node_incremental = "<C-w>",
						scope_incremental = false,
						node_decremental = "<C-b>",
					},
				}
			})
		end,
	},
	-- { -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	lazy = true,
	-- 	config = function()
	-- 		---@diagnostic disable-next-line: missing-fields
	-- 		require("nvim-treesitter.configs").setup({
	-- 			textobjects = {
	-- 				select = {
	-- 					enable = true,
	-- 					-- Automatically jump forward to textobj, similar to targets.vim
	-- 					lookahead = true,
	-- 					keymaps = {
	-- 						-- block
	-- 						["ab"] = { query = "@block.outer", desc = "outer block" },
	-- 						["ib"] = { query = "@block.inner", desc = "inner block" },
	-- 						-- method/function definition
	-- 						["af"] = { query = "@function.outer", desc = "inner method/function definition" },
	-- 						["if"] = { query = "@function.inner", desc = "outer method/function definition" },
	-- 						-- method/function call
	-- 						["aF"] = { query = "@call.outer", desc = "inner method/function call" },
	-- 						["iF"] = { query = "@call.inner", desc = "outer method/function call" },
	-- 						-- argument
	-- 						["aa"] = { query = "@parameter.outer", desc = "outer argument" },
	-- 						["ia"] = { query = "@parameter.inner", desc = "inner argument" },
	-- 						-- conditional
	-- 						["ai"] = { query = "@conditional.outer", desc = "outer conditional" },
	-- 						["ii"] = { query = "@conditional.inner", desc = "inner conditional" },
	-- 						-- class
	-- 						["ac"] = { query = "@class.outer", desc = "inner class" },
	-- 						["ic"] = { query = "@class.inner", desc = "outer class" },
	-- 						-- assignment
	-- 						["a="] = { query = "@assignment.outer", desc = "outer assignment" },
	-- 						["i="] = { query = "@assignment.inner", desc = "inner assignment" },
	-- 						["l="] = { query = "@assignment.lhs", desc = "left hand side assignment" },
	-- 						["r="] = { query = "@assignment.rhs", desc = "right hand side assignment" },
	-- 						-- loop
	-- 						["al"] = { query = "@loop.outer", desc = "outer loop" },
	-- 						["il"] = { query = "@loop.inner", desc = "inner loop" },
	-- 						-- regex
	-- 						["ar"] = { query = "@regex.outer", desc = "outer regex" },
	-- 						["ir"] = { query = "@regex.inner", desc = "inner regex" },
	-- 					},
	-- 				},
	-- 				swap = {
	-- 					enable = true,
	-- 					swap_next = {
	-- 						["mb"] = { query = "@block.outer", desc = "Swap function with next" },
	-- 						["mf"] = { query = "@function.outer", desc = "Swap function with next" },
	-- 					},
	-- 					swap_previous = {
	-- 						["mB"] = { query = "@block.outer", desc = "Swap block with previous" },
	-- 						["mF"] = { query = "@function.outer", desc = "Swap block with previous" },
	-- 					},
	-- 				},
	-- 				move = {
	-- 					enable = true,
	-- 					set_jumps = true, -- add to jumplist
	-- 					goto_next_start = {
	-- 						["]b"] = { query = "@block.outer", desc = "Move to start of next block" },
	-- 						["]f"] = { query = "@function.outer", desc = "Move to start of next function" },
	-- 						["]i"] = { query = "@conditional.outer", desc = "Move to start of next conditional" },
	-- 						["]c"] = { query = "@class.outer", desc = "Move to start of next class" },
	-- 					},
	-- 					goto_next_end = {
	-- 						["]B"] = { query = "@block.outer", desc = "Move to end of next block" },
	-- 						["]F"] = { query = "@function.outer", desc = "Move to end of next function" },
	-- 						["]I"] = { query = "@conditional.outer", desc = "Move to end of next conditional" },
	-- 						["]C"] = { query = "@class.outer", desc = "Move to end of next class" },
	-- 					},
	-- 					goto_previous_start = {
	-- 						["[b"] = { query = "@block.outer", desc = "Move to start of previous block" },
	-- 						["[f"] = { query = "@function.outer", desc = "Move to start of previous function" },
	-- 						["[i"] = { query = "@conditional.outer", desc = "Move to start of previous conditional" },
	-- 						["[c"] = { query = "@class.outer", desc = "Move to start of previous class" },
	-- 					},
	-- 					goto_previous_end = {
	-- 						["[B"] = { query = "@block.outer", desc = "Move to end of previous block" },
	-- 						["[F"] = { query = "@function.outer", desc = "Move to end of previous function" },
	-- 						["[I"] = { query = "@conditional.outer", desc = "Move to end of previous conditional" },
	-- 						["[C"] = { query = "@class.outer", desc = "Move to end of previous class" },
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
	--
	-- 		-- vim way: ; goes to the direction you were moving.
	-- 		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
	-- 		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
	-- 	end,
	-- },
}

