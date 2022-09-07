require("user.ft_wk")("clojure", {
	b = { "<cmd>ConjureEvalBuf<CR>", "Eval Buffer" },
	f = { "<cmd>ConjureEvalFile<CR>", "Eval File" },
	v = { "<cmd>ConjureEvalVisual<CR>", "Eval Block", mode = "v" },

	e = { "<cmd>ConjureEvalCurrentForm<CR>", "Eval Current Form" },
	r = { "<cmd>ConjureEvalRootForm<CR>", "Eval Root Form" },
	w = { "<cmd>ConjureEvalWord<CR>", "Eval Word" },

	c = {
		name = "+Comment",
		e = { "<cmd>ConjureEvalCommentCurrentForm<CR>", "Eval Current Form As Comment" },
		r = { "<cmd>ConjureEvalCommentRootForm<CR>", "Eval Root Form As Comment" },
		w = { "<cmd>ConjureEvalCommentWord<CR>", "Eval Word As Comment" },
	},
	l = {
		name = "+Log",
		s = { "<cmd>ConjureLogSplit<CR>", "Open Log in Split" },
		v = { "<cmd>ConjureLogVSplit<CR>", "Open Log in VSplit" },
		t = { "<cmd>ConjureLogTab<CR>", "Open Log in Tab" },
		b = { "<cmd>ConjureLogBuf<CR>", "Open Log in Current Window" },
		c = { "<cmd>ConjureLogCloseVisible<CR>", "Close all log windows" },
		r = { "<cmd>ConjureLogResetSoft<CR>", "Reset" },
		l = { "<cmd>ConjureLogJumpToLatest<CR>", "Jump to Last Eval Result" },
	},
})
