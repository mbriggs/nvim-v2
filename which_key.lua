return function(config)
	local my_config = {
		[";"] = { [[<cmd>lua require("user.lsp_fixcurrent")()<cr>]], "QuickFix" },
		["<space>"] = { [[<cmd>Telescope oldfiles<cr>]], "Find Old File" },
		["<cr>"] = { [[<cmd>q<cr>]], "Close Window" },
		["-"] = { [[<cmd>only<cr>]], "Close other splits" },
		["'"] = { [[<cmd>vs<cr>]], "Split" },
		[","] = { [[<cmd>sp<cr>]], "Horizontal Split" },
		["."] = { [[<cmd>Telescope lsp_definitions<cr>]], "Go to Definition" },
		[">"] = { [[<cmd>Telescope lsp_references<cr>]], "Go to other references" },

		h = { nil },

		["E"] = {
			name = "+Editor",
			m = { [[<cmd>Telescope marks<cr>]], "Marks" },
			h = { [[<cmd>Telescope help_tags<cr>]], "Help Tag" },
			[";"] = { [[<cmd>Telescope commands<cr>]], "Commands" },
			c = { [[<cmd>Telescope command_history<cr>]], "Previous Commands" },
			k = { [[<cmd>Telescope keymaps<cr>]], "Keymap" },
			w = { "<cmd>WinShift<cr>", "Move Window" },
			u = {
				name = "+Sudo",
				r = { "<cmd>SudaRead<cr>", "Read file with sudo" },
				w = { "<cmd>SudaWrite<cr>", "Write file with sudo" },
			},
			s = { "<cmd>Sort<cr>", "Sort" },
			t = { ':s/"\\(\\w\\) \\(\\w\\)"/\\1", "\\2/g<cr>', "Split word string" },
		},

		["t"] = {
			name = "+Test",
			t = { "<cmd>TestNearest<cr>", "Test Nearest" },
			f = { "<cmd>TestFile<cr>", "Test File" },
			a = { "<cmd>TestSuite<cr>", "Test Suite" },
			[";"] = { "<cmd>TestLast<cr>", "Rerun Last Test" },
			["."] = { "<cmd>TestVisit<cr>", "Visit Test" },
		},

		["T"] = config.T,

		["x"] = {
			name = "+Trouble",
			x = { "<cmd>TroubleClose<cr>", "Close" },
			f = { "<cmd>TroubleToggle definitions<cr>", "Definitions" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
			r = { "<cmd>TroubleToggle references<cr>", "References" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
			t = { "<cmd>TodoTrouble<cr>", "TODOs" },
		},

		["q"] = {
			name = "+Quit",
			q = { "<cmd>:qa<cr>", "Quit" },
			c = { "<cmd>:q!<cr>", "Close" },
			k = { "<cmd>:qa!<cr>", "Quit without saving" },
			s = { "<cmd>:wa | qa!<cr>", "Quit and save" },
		},
	}

	return vim.tbl_deep_extend("force", config, my_config)
end
