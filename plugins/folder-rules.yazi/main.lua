local function setup()
	local special_dirs = {
		"Downloads",
		"Screenshots",
		"Captures",
		"Temp",
	}

	ps.sub("cd", function()
		local cwd = cx.active.current.cwd
		local match = false
		for _, dir in ipairs(special_dirs) do
			if cwd:ends_with(dir) then
				match = true
				break
			end
		end

		if match then
			ya.emit("sort", { "mtime", reverse = true, dir_first = false })
		else
			ya.emit("sort", { "alphabetical", reverse = false, dir_first = true })
		end
	end)
end

return { setup = setup }
