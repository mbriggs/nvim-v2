return function(config)
	local provider = require("core.status").provider
	local components = config.components.active[1]
	local rcomponents = config.components.active[2]

	-- insert name into statusline
	table.insert(components, 4, { provider = provider.spacer(2) })
	table.insert(components, 5, {
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
			},
		},
	})
	table.remove(components, 7) -- remove ft
	table.remove(components, 7) -- remove ft spacer

	table.remove(rcomponents, 2) -- remove lsp names
	table.remove(rcomponents, 2) -- remove lsp names spacer

	return config
end
