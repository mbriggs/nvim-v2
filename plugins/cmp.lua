local cmp = require("cmp")

return {
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.config.disable,
		["<S-Tab>"] = cmp.config.disable,
	},
}
