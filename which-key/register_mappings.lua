local function toggleLines()
	local new_value = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_lines = new_value,
		virtual_text = not new_value,
	})
	return new_value
end

return {
	n = {
		["<leader>"] = {
			[","] = {
				name = "+Local",
			},
			[":"] = { [[<cmd>lua require("user.lsp_fixcurrent")()<cr>]], "QuickFix" },
			[";"] = { "<cmd>Telescope find_files<cr>", "Files" },
			["<cr>"] = { [[<cmd>q<cr>]], "Close Window" },
			["-"] = { [[<cmd>only<cr>]], "Close other splits" },
			["'"] = { [[<cmd>vs<cr>]], "Split" },
			['"'] = { [[<cmd>sp<cr>]], "Horizontal Split" },
			["."] = { [[<cmd>Telescope lsp_definitions<cr>]], "Go to Definition" },
			[">"] = { [[<cmd>Telescope lsp_references<cr>]], "Go to other references" },
			["/"] = {
				toggleLines,
				"Toggle Diagnostics",
			},
			["o"] = { [[<cmd>Neotree reveal<cr>]], "Open Explorer" },
			["r"] = { [[<cmd>lua require('telescope').extensions.recent_files.pick()<cr>]], "Recent Files" },
			["R"] = { "<cmd>lua require('spectre').open()<CR>", "Search and Replace" },

			w = {
				function()
					local winid = require("winpick").select()

					if winid then
						vim.api.nvim_set_current_win(winid)
					end
				end,
				"Pick Window",
			},

			g = {
				c = { [[<cmd>DiffviewFileHistory %<cr>]], "File Commits" },
				C = { [[<cmd>DiffviewFileHistory<cr>]], "Branch Commits" },
				d = { [[<cmd>DiffviewOpen<cr>]], "View git diff" },
			},

			q = { "<cmd>:qa<cr>", "Quit" },
			Q = { "<cmd>:qa!<cr>", "Quit without saving" },

			h = { nil },
			c = { nil },

			["E"] = {
				name = "+Editor",
				m = { [[<cmd>Telescope marks<cr>]], "Marks" },
				h = { [[<cmd>Telescope help_tags<cr>]], "Help Tag" },
				[";"] = { [[<cmd>Telescope commands<cr>]], "Commands" },
				c = { [[<cmd>Telescope command_history<cr>]], "Previous Commands" },
				k = { [[<cmd>Telescope keymaps<cr>]], "Keymap" },
				w = { "<cmd>WinShift<cr>", "Move Window" },
				a = { [[<cmd>AstroUpdate<cr>]], "Astro Update" },
				u = {
					name = "+Sudo",
					r = { "<cmd>SudaRead<cr>", "Read file with sudo" },
					w = { "<cmd>SudaWrite<cr>", "Write file with sudo" },
				},
				s = { "<cmd>Sort<cr>", "Sort" },
				t = { ':s/"\\(\\w\\) \\(\\w\\)"/\\1", "\\2/g<cr>', "Split word string" },
			},

			["s"] = {
				g = { [[<cmd>Telescope git_bcommits<cr>]], "Buffer Commits" },
				G = { [[<cmd>Telescope git_commits<cr>]], "Git Commits" },
			},

			["t"] = {
				name = "+Test",
				t = { "<cmd>TestNearest<cr>", "Test Nearest" },
				f = { "<cmd>TestFile<cr>", "Test File" },
				a = { "<cmd>TestSuite<cr>", "Test Suite" },
				[";"] = { "<cmd>TestLast<cr>", "Rerun Last Test" },
				["."] = { "<cmd>TestVisit<cr>", "Visit Test" },
			},

			["T"] = {
				name = "+Terminal",
				n = {
					function()
						require("core.utils").toggle_term_cmd("node")
					end,
					"Node",
				},
				u = {
					function()
						require("core.utils").toggle_term_cmd("ncdu")
					end,
					"NCDU",
				},
				t = {
					function()
						require("core.utils").toggle_term_cmd("htop")
					end,
					"Htop",
				},
				p = {
					function()
						require("core.utils").toggle_term_cmd("python")
					end,
					"Python",
				},
				l = {
					function()
						require("core.utils").toggle_term_cmd("lazygit")
					end,
					"Lazygit",
				},
				f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
				h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
				v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
			},

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

			a = {
				name = "Annotate",
				["<cr>"] = {
					function()
						require("neogen").generate()
					end,
					"Current",
				},
				c = {
					function()
						require("neogen").generate({ type = "class" })
					end,
					"Class",
				},
				f = {
					function()
						require("neogen").generate({ type = "func" })
					end,
					"Function",
				},
				t = {
					function()
						require("neogen").generate({ type = "type" })
					end,
					"Type",
				},
				F = {
					function()
						require("neogen").generate({ type = "file" })
					end,
					"File",
				},
			},

			f = {
				name = "Telescope",
				["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
				c = { "<cmd>Telescope commands<cr>", "Commands" },
				f = { "<cmd>Telescope find_files<cr>", "Files" },
				F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
				h = { "<cmd>Telescope oldfiles<cr>", "History" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				M = { "<cmd>Telescope media_files<cr>", "Media" },
				n = { "<cmd>Telescope notify<cr>", "Notifications" },
				p = { "<cmd>Telescope project<cr>", "Projects" },
				r = { "<cmd>Telescope registers<cr>", "Registers" },
				t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
				w = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Words" },
				o = {
					function()
						require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
					end,
					"Other file",
				},
				d = {
					function()
						require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
					end,
					"Words in directory",
				},
			},

			d = {
				name = "+Debugger",
				b = {
					function()
						require("dap").toggle_breakpoint()
					end,
					"Toggle Breakpoint",
				},
				B = {
					function()
						require("dap").clear_breakpoints()
					end,
					"Clear Breakpoints",
				},
				c = {
					function()
						require("dap").continue()
					end,
					"Continue",
				},
				i = {
					function()
						require("dap").step_into()
					end,
					"Step Into",
				},
				l = {
					function()
						require("dapui").float_element("breakpoints")
					end,
					"List Breakpoints",
				},
				o = {
					function()
						require("dap").step_over()
					end,
					"Step Over",
				},
				q = {
					function()
						require("dap").close()
					end,
					"Close Session",
				},
				Q = {
					function()
						require("dap").terminate()
					end,
					"Terminate",
				},
				r = {
					function()
						require("dap").repl.toggle()
					end,
					"REPL",
				},
				s = {
					function()
						require("dapui").float_element("scopes")
					end,
					"Scopes",
				},
				t = {
					function()
						require("dapui").float_element("stacks")
					end,
					"Threads",
				},
				u = {
					function()
						require("dapui").toggle()
					end,
					"Toggle Debugger UI",
				},
				w = {
					function()
						require("dapui").float_element("watches")
					end,
					"Watches",
				},
				x = {
					function()
						require("dap.ui.widgets").hover()
					end,
					"Inspect",
				},
			},
		},
		g = {
			d = { "Go to definition" },
			D = { "Go to declaration" },
			I = { "Go to implementation" },
			r = { "Go to references" },
			o = { "Open diagnostic" },
		},

		["]"] = {
			d = { "Next diagnostic" },
			f = "Next function start",
			x = "Next class start",
			F = "Next function end",
			X = "Next class end",
		},

		["["] = {
			d = { "Previous diagnostic" },
			f = { "Previous function start" },
			x = { "Previous class start" },
			F = { "Previous function end" },
			X = { "Previous class end" },
		},
	},

	i = {
		["<c-d>"] = {
			n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
			x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
			f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
			X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
			F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
			d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
		},
	},

	v = {
		["/"] = { "Comment" },

		x = {
			name = "Debugger",
			e = {
				function()
					require("dapui").eval()
				end,
				"Evaluate Line",
			},
		},
	},
}
