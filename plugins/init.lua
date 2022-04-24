local core = {
	{
		"aserowy/tmux.nvim",
		config = require("user.plugins.tmux"),
	},
	-- do not jump on star
	{
		"ironhouzi/starlite-nvim",
		config = require("user.plugins.starlite"),
	},

	{
		"ojroques/nvim-bufdel",
		config = require("user.plugins.bufdel"),
	},

	{
		"andymass/vim-matchup",
		config = require("user.plugins.matchup"),
	},
	{
		"sindrets/winshift.nvim",
		config = require("user.plugins.winshift"),
	},
	{
		"sQVe/sort.nvim",
		config = require("user.plugins.sort"),
	},
	{
		"winston0410/range-highlight.nvim",
		requires = {
			"winston0410/cmd-parser.nvim",
		},
		config = require("user.plugins.winshift"),
	},
	{
		"monaqa/dial.nvim",
		config = require("user.plugins.dial"),
	},
	{ "ConradIrwin/vim-bracketed-paste" },
	{ "google/vim-searchindex" },
	{ "justinmk/vim-gtfo" },
	{ "lambdalisue/reword.vim" },
	{ "lambdalisue/suda.vim" },
	{ "lambdalisue/vim-protocol" },
	{ "machakann/vim-highlightedyank" },
	{ "tpope/vim-afterimage" },
	{ "tpope/vim-apathy" },
	{ "tpope/vim-jdaddy" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-unimpaired" },

	{
		"ggandor/leap.nvim",
		config = require("user.plugins.leap"),
	},

	{
		"abecodes/tabout.nvim",
		config = require("user.plugins.tabout"),
		wants = { "nvim-treesitter" }, -- or require if not used so far
		-- after = { "completion-nvim" }, -- if a completion plugin is using tabs load it before
	},
}

local fix = {
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = require("user.plugins.todo-comments"),
	},

	{
		"kevinhwang91/nvim-bqf",
		requires = {
			{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
			"junegunn/fzf.vim",
		},
		ft = "qf",
	},
}

local lsp = {
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = require("user.plugins.lsp_signature"),
	},
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("user.plugins.trouble"),
		cmd = "TroubleToggle",
	},
}

local objects = {
	{ "kana/vim-textobj-user" },
	{ "kana/vim-niceblock" },
	{ "Julian/vim-textobj-variable-segment" },
	{ "glts/vim-textobj-comment" },
	{ "kana/vim-textobj-entire" },
	{ "rhysd/vim-textobj-anyblock" },
	{ "chaoren/vim-wordmotion", setup = [[vim.g.wordmotion_prefix = '<space>']] },
}

local tools = {
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = require("user.plugins.gitlinker"),
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"pwntester/octo.nvim",
		event = "BufRead",
	},
	{
		"janko/vim-test",
		requires = "preservim/vimux",
		config = [[vim.g['test#strategy'] = 'vimux']],
	},
}

return function(plugins)
	local label = require("core.utils").label_plugins

	-- Disabled Default Plugins
	plugins["glepnir/dashboard-nvim"] = nil
	plugins["max397574/better-escape.nvim"] = nil
	plugins["akinsho/bufferline.nvim"] = nil
	plugins["p00f/nvim-ts-rainbow"] = nil

	local combined = vim.tbl_deep_extend(
		"force",
		plugins,
		label(core),
		label(tools),
		label(fix),
		label(lsp),
		label(objects)
	)

	return combined
end
