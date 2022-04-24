return function()
	local a = vim.api

	a.nvim_set_keymap("n", "*", ":lua require('starlite').star()<cr>", { silent = true })
	a.nvim_set_keymap("n", "g*", ":lua require('starlite').g_star()<cr>", { silent = true })
	a.nvim_set_keymap("n", "#", ":lua require('starlite').hash()<cr>", { silent = true })
	a.nvim_set_keymap("n", "g#", ":lua require('starlite').g_hash()<cr>", { silent = true })
end
