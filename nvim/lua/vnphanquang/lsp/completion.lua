return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
			keymap = {
				preset = "none",
				["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
				["<CR>"] = { "select_and_accept", "fallback" },
				--
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				--
				["J"] = { "scroll_documentation_down", "fallback" },
				["K"] = { "scroll_documentation_up", "fallback" },
				--
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				--
			},
		},
		opts_extend = { "sources.default" },
	},
}
