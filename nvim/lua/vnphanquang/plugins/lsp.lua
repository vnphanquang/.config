-- LSP Configuration & Plugins
-- https://github.com/neovim/nvim-lspconfig

return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		config = function()
			require("lazydev").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			-- Useful status updates for LSP.
			"j-hui/fidget.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local telescopeBuiltin = require("telescope.builtin")
			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gh", vim.lsp.buf.hover, "[h]over documentation")
					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", telescopeBuiltin.lsp_definitions, "[g]oto [d]efinition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[g]oto [d]eclaration")
					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("<leader>li", telescopeBuiltin.lsp_implementations, "[i]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					-- map("<leader>D", telescopeBuiltin.lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>lsS", telescopeBuiltin.lsp_document_symbols, "[s]earch all [s]ymbols in document")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map("<leader>lsS", telescopeBuiltin.lsp_dynamic_workspace_symbols, "[s]earch all [S]ymbols in workspace")

					-- Find references for the word under your cursor.
					map("<leader>lsr", telescopeBuiltin.lsp_references, "[s]earch all [r]eferences")

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>lr", vim.lsp.buf.rename, "[r]eame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>la", vim.lsp.buf.code_action, "[a]ction")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- see https://docs.astral.sh/ruff/editors/setup/#neovim
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == "ruff" then
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = "LSP: Disable hover capability from Ruff",
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

			local function node_not_deno_root_dir(filename)
				local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(filename)
				if denoRootDir then
					return nil
				end
				return lspconfig.util.root_pattern("package.json")(filename)
			end

			local servers = {
				["rust_analyzer"] = {},
				ts_ls = {
					root_dir = function(filename)
						local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(filename)
						if denoRootDir then
							return nil
						end
						return lspconfig.util.root_pattern("package.json", "tsconfig.json")(filename)
					end,
					single_file_support = false,
				},
				-- denols = {
				-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
				-- 	root_markers = { "deno.json", "deno.jsonc" },
				-- 	-- init_options = {
				-- 	-- 	lint = true,
				-- 	-- 	unstable = true,
				-- 	-- },
				-- },
				svelte = {
					-- https://github.com/sveltejs/language-tools/issues/2008
					-- on_attach = function(client)
					-- 	vim.api.nvim_create_autocmd("BufWritePost", {
					-- 		pattern = { "*.js", "*.ts" },
					-- 		callback = function(ctx)
					-- 			client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					-- 		end,
					-- 	})
					-- end,
				},
				marksman = {},
				eslint_d = {
					root_dir = node_not_deno_root_dir,
					settings = {
						useFlatConfig = true,
						experimental = {
							useFlatConfig = true,
						},
					},
				},
				["eslint-lsp"] = {
					root_dir = node_not_deno_root_dir,
					settings = {
						useFlatConfig = true,
						experimental = {
							useFlatConfig = true,
						},
					},
				},
				prettierd = {
					root_dir = node_not_deno_root_dir,
				},
				prettier = {
					root_dir = node_not_deno_root_dir,
				},
				stylelint = {
					filetypes = { "css", "scss", "svelte", "postcss", "html" },
				},
				stylelint_lsp = {
					filetypes = { "css", "scss", "svelte", "postcss", "html" },
					root_dir = lspconfig.util.root_pattern("package.json"),
					settings = {
						stylelintplus = {
							-- see available options in stylelint-lsp documentation
						},
					},
					on_attach = function(client)
						client.server_capabilities.document_formatting = false
					end,
				},
				["tailwindcss-language-server"] = {},
				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							diagnostics = {
								-- disable = { 'missing-fields' }
								globals = { "vim" },
							},
						},
					},
				},
				yamlls = {},
				yamlfix = {},
				yamlfmt = {},

				dockerls = {},
				docker_compose_language_service = {},

				-- python specifics
				-- see https://docs.astral.sh/ruff/editors/setup/#neovim
				ruff = {},
				pyright = {
					settings = {
						pyright = {
							-- Using Ruff's import organizer
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								-- Ignore all files for analysis to exclusively use Ruff for linting
								ignore = { "*" },
							},
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu.
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				"js-debug-adapter", -- used in conjunction with nvim-dap, see `dap.lua`
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						lspconfig[server_name].setup(server)
					end,
				},
			})
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				-- snippet = {
				-- 	expand = function(args)
				-- 		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- 	end,
				-- },
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-k>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
