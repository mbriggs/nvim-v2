local cmp = require("cmp")

return {
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.config.disable,
		["<S-Tab>"] = cmp.config.disable,
		["<ESC>"] = function(fallback)
			if cmp.visible() then
				cmp.abort()
			else
				fallback()
			end
		end,
	},
}
