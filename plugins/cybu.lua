return function()
	vim.keymap.set("n", "-", "<Plug>(CybuPrev)")
	vim.keymap.set("n", "_", "<Plug>(CybuNext)")

	local cybu = require("cybu")
	cybu.setup()
end
