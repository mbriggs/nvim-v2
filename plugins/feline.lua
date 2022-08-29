return function(config)
	local provider = require("core.status").provider
	local components = config.components.active[1]
	-- insert name into statusline
	table.insert(components, 4, { provider = provider.spacer(2) })
	table.insert(components, 5, {
		provider = "file_info",
		type = "unique-short",
	})
	table.remove(components, 7) -- remove ft
	table.remove(components, 7) -- remove ft spacer
	return config
end
