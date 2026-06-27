--- @param bufnr number
--- @return string|nil
local function get_node_root(bufnr)
	local node_root = vim.fs.root(bufnr, "package.json")
	return node_root
end

--- @param bufnr number
--- @return string|nil
local function get_deno_root(bufnr)
	local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
	return deno_root
end

--- lua 5.1 compatible table unpack
--- @see unpack
local function backwardcompatible_unpack(list)
	local __unpack__ = table.unpack or unpack
	return __unpack__(list)
end

--- @class NotiOptions
--- @field title? string Optional title for the notification.
--- @field message? string Optional message body.
--- @field level? number Optional severity level (e.g., 1, 2, "info", "error").

--- @class Noti
--- @field start fun(options: NotiOptions) Function to start the notification spinner.
--- @field finish fun(options: NotiOptions) Function to finish the notification spinner.

--- Wraps a function or process with a spinner notification.
--- @param callback fun(noti: Noti) An object containing start and end notification methods.
local function with_spinner_noti(callback)
	local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local frame_idx = 1

	local timer = vim.loop.new_timer()

	--- @type any
	local ref = nil

	--- @type Noti
	local noti = {
		start = function(options)
			if not ref then
				ref = vim.notify(options.message or "Processing...", options.level or vim.log.levels.INFO, {
					title = options.title,
					icon = frames[frame_idx],
				})
				if timer then
					timer:start(
						0,
						100,
						vim.schedule_wrap(function()
							frame_idx = (frame_idx % #frames) + 1

							-- Update the existing notification text with the new spinner frame
							ref = vim.notify(options.message or "Processing...", options.level or vim.log.levels.INFO, {
								title = options.title,
								icon = frames[frame_idx],
								replace = ref,
							})
						end)
					)
				end
			end
		end,
		finish = function(options)
			if timer then
				if timer:is_active() then
					timer:stop()
				end
				timer:close()
			end
			vim.notify(options.message or "Done!", options.level or vim.log.levels.INFO, {
				title = options.title,
				icon = "✔",
				replace = ref,
			})
		end,
	}

	callback(noti)
end

return {
	get_node_root = get_node_root,
	get_deno_root = get_deno_root,
	with_spinner_noti = with_spinner_noti,
	unpack = backwardcompatible_unpack,
}
