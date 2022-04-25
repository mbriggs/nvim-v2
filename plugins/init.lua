-- Core --
-- augment core functionality
local core = {
	-- navigate tmux and vim splits transparently
	{
		"aserowy/tmux.nvim",
		config = require("user.plugins.tmux"),
	},
	-- move splits around
	{
		"sindrets/winshift.nvim",
		config = require("user.plugins.winshift"),
	},
	-- open file
	{ "justinmk/vim-gtfo" },
	-- casing aware search and replace
	{ "lambdalisue/reword.vim" },
	-- reload file with sudo
	{ "lambdalisue/suda.vim" },
	-- utility mappings
	{ "tpope/vim-unimpaired" },
	-- movement
	{
		"ggandor/leap.nvim",
		config = require("user.plugins.leap"),
	},
}

-- Fix --
-- fix functionality to work better
local fix = {
	-- highlight things like todo in comments
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = require("user.plugins.todo-comments"),
	},
	-- tab out of delimiters
	{
		"abecodes/tabout.nvim",
		config = require("user.plugins.tabout"),
		wants = { "nvim-treesitter" },
	},
	-- open files over ssh
	{ "lambdalisue/vim-protocol" },
	-- highlight yanks
	{ "machakann/vim-highlightedyank" },
	-- support . for more things
	{ "tpope/vim-repeat" },
	-- work on delims
	{ "tpope/vim-surround" },
	-- do not jump on star
	{
		"ironhouzi/starlite-nvim",
		config = require("user.plugins.starlite"),
	},
	-- advanced qflist
	{
		"kevinhwang91/nvim-bqf",
		requires = {
			{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
			"junegunn/fzf.vim",
		},
		ft = "qf",
	},
}

-- LSP --
-- language server tools
local lsp = {
	-- popup documentation
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = require("user.plugins.lsp_signature"),
	},
	-- refactoring tools
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- diagnostic window
	{
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("user.plugins.trouble"),
		cmd = "TroubleToggle",
	},
}

-- Objects --
-- custom text objects
local objects = {
	-- custom text objects
	{ "kana/vim-textobj-user" },
	-- c == comment
	{ "glts/vim-textobj-comment" },
	-- e = entire buffer
	{ "kana/vim-textobj-entire" },
	-- b == many things
	{ "rhysd/vim-textobj-anyblock" },
	-- space = operate on segment
	{ "chaoren/vim-wordmotion", setup = [[vim.g.wordmotion_prefix = '<space>']] },
}

-- Tools --
-- add tools to nvim
local tools = {
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = require("user.plugins.gitlinker"),
		requires = "nvim-lua/plenary.nvim",
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
