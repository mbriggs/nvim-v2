return function()
	require("sort").setup({
		delimiters = {
			",",
			"|",
			";",
			":",
			"s", -- Space
			"t", -- Tab
		},
	})
end
