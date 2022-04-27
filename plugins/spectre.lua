return function()
	require("spectre").setup({
		live_update = true, -- auto execute search again when you write any file in vim
		mapping = {
			["toggle_line"] = {
				map = "dd",
				cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
				desc = "toggle current item",
			},
			["enter_file"] = {
				map = "<cr>",
				cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
				desc = "goto current file",
			},
			["send_to_qf"] = nil,
			["replace_cmd"] = nil,
			["show_option_menu"] = nil,
			["run_replace"] = nil,
			["change_view_mode"] = nil,
			["toggle_live_update"] = nil,
			["toggle_ignore_case"] = nil,
			["toggle_ignore_hidden"] = nil,
		},
	})
end
