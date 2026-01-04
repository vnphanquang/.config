--- @class LspTool
--- @field mason_id string name of tool in Mason registry
--- @field config? vim.lsp.Config configuration passed to `vim.lsp.config`
--- @field unsupported_os? ("Darwin" | "Windows" | "Linux")[] list of OSes where this tool should not be installed
--- @field plugins? table[] list of additional Lazy plugins to install

--- @param input string | LspTool | (LspTool | string)[]
--- @return LspTool[]
local function define_lsp_tools(input)
	if type(input) == "string" then
		return { { mason_id = input } }
	elseif type(input) == "table" and input.mason_id then
		return { input }
	elseif type(input) == "table" then
		local tools = {}
		for _, tool in ipairs(input) do
			if type(tool) == "string" then
				table.insert(tools, { mason_id = tool })
			elseif type(tool) == "table" and tool.mason_id then
				table.insert(tools, tool)
			else
				error("Invalid definition for LspTool")
			end
		end
		return tools
	else
		error("Invalid definition for LspTool")
	end
end

--- @class LspEcosystem
--- @field config fun() function to configure each tool via `vim.lsp.config`
--- @field mason_ids string[] list of tool names in Mason registry
--- @field plugins table[] list of additional Lazy plugins to install

--- @param ... LspTool[][]
--- @return LspEcosystem
local function define_lsp_ecosystem(...)
	local plugins = {}

	---@type string[]
	local mason_ids = {}

	---@type LspTool[]
	local tools = {}

	for _, group in ipairs(...) do
		for _, tool in ipairs(group) do
			---@diagnostic disable-next-line: undefined-field
			local os = vim.uv.os_uname().sysname
			if not tool.unsupported_os or not tool.unsupported_os[os] then
				table.insert(mason_ids, tool.mason_id)
				table.insert(tools, tool)

				if tool.plugins then
					for _, plugin in ipairs(tool.plugins) do
						table.insert(plugins, plugin)
					end
				end
			end
		end
	end

	return {
		mason_ids = mason_ids,
		config = function()
			for _, tool in ipairs(tools) do
				if tool.config then
					vim.lsp.config(tool.mason_id, tool.config)
				end
			end
		end,
		plugins = plugins,
	}
end

return {
	define_lsp_tools = define_lsp_tools,
	define_lsp_ecosystem = define_lsp_ecosystem,
}
