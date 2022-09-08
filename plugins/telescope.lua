local actions = require("telescope.actions")

return {
	defaults = {
		file_ignore_patterns = { "vendor" },
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-j>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,
				["<ESC>"] = actions.close,
			},
			-- for normal mode
			n = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
			},
		},
	},
}
