--- @param bufnr number
--- @return string|nil
local function get_node_root(bufnr)
	local node_root = vim.fs.root(bufnr, 'package.json')
	return node_root
end

--- @param bufnr number
--- @return string|nil
local function get_deno_root(bufnr)
	local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
	return deno_root
end

--- lua 5.1 compatible table unpack
--- @see unpack
local function backwardcompatible_unpack(list)
	local __unpack__ = table.unpack or unpack
	return __unpack__(list)
end

return {
	get_node_root = get_node_root,
	get_deno_root = get_deno_root,
	unpack = backwardcompatible_unpack,
}
