return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "mxsdev/nvim-dap-vscode-js" },
		config = function()
			local dap = require("dap")
			---@diagnostic disable-next-line: missing-fields
			require("dap-vscode-js").setup({
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "8123",
				executable = {
					command = "node",
				},
			}

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Run current file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
					},
				}
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			---@diagnostic disable-next-line: missing-fields
			dapui.setup({
				element_mappings = {
					stacks = {
						open = "<CR>",
					},
				},
			})
			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.launch["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- custom keybindings
			vim.keymap.set("n", "<Leader>ldb", function()
				dap.toggle_breakpoint()
			end, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>ldc", function()
				dap.continue()
			end, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<Leader>ldn", function()
				dap.step_over()
			end, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<Leader>ldi", function()
				dap.step_into()
			end, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<Leader>ldo", function()
				dap.step_out()
			end, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<Leader>ldq", function()
				dap.terminate()
			end, { desc = "Debug: Quit" })
			vim.keymap.set("n", "<Leader>ld?", function()
				---@diagnostic disable-next-line: missing-fields
				dapui.eval(nil, { enter = true })
			end, { desc = "Debug: Eval var under cursor" })
			vim.keymap.set("n", "<Leader>lds", function()
				dap.up()
			end, { desc = "Debug: Go up in stacktrace" })
			vim.keymap.set("n", "<Leader>ldS", function()
				dap.down()
			end, { desc = "Debug: Go down in stacktrace" })
		end,
	},
}
