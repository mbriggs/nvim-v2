local cmp = require("cmp")

return {
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
}
