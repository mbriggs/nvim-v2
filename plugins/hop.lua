return function()
	local map = vim.keymap.set
	local hop = require("hop")
	local hint = require("hop.hint").HintDirection

	hop.setup({})

	map("n", "s", function()
		hop.hint_char2({
			direction = hint.AFTER_CURSOR,
		})
	end)

	map("n", "S", function()
		hop.hint_char2({
			direction = hint.BEFORE_CURSOR,
		})
	end)

	map("n", "<c-g>", function()
		hop.hint_lines_skip_whitespace()
	end)
end
