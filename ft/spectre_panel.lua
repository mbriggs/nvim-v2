require("user.ft_wk")("spectre_panel", {
	n = {
		["<leader>,"] = {
			q = { "<cmd>lua require('spectre.actions').send_to_qf()<CR>", "Send to quickfix" },
			c = { "<cmd>lua require('spectre.actions').replace_cmd()<CR>", "Input replace vim command" },
			o = { "<cmd>lua require('spectre').show_options()<CR>", "Show option menu" },
			R = { "<cmd>lua require('spectre.actions').run_replace()<CR>", "Replace all" },
			v = { "<cmd>lua require('spectre').change_view()<CR>", "Change result view  mode" },
			t = {
				name = "+Toggle",
				u = { "<cmd>lua require('spectre').toggle_live_update()<CR>", "Toggle live update" },
				i = { "<cmd>lua require('spectre').change_options('ignore-case')<CR>", "Toggle ignore case" },
				h = { "<cmd>lua require('spectre').change_options('hidden')<CR>", "Toggle ignore hidden" },
			},
		},
	},
})
