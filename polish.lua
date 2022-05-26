return function()
	local map = vim.keymap.set
	local set = vim.opt
	-- Set options
	set.relativenumber = true
	set.wrap = true

	-- Set key bindings
	map("n", "<C-s>", ":w!<CR>")

	map("n", "<CR>", ":nohlsearch<CR>:w<CR>")
	-- H / L for start / end of line
	map("n", "<s-h>", "^")
	map("n", "<s-l>", "$")

	-- put current dir into command
	map("c", "%%", "<C-R>=expand('%:h').'/'<cr>")

	-- go to previous buffer
	map("n", "-", "<c-^>")

	-- resize
	map("n", "<C-k>", function()
		require("smart-splits").resize_up()
	end)
	map("n", "<C-j>", function()
		require("smart-splits").resize_down()
	end)
	map("n", "<C-h>", function()
		require("smart-splits").resize_left()
	end)
	map("n", "<C-l>", function()
		require("smart-splits").resize_right()
	end)

	--tmux
	map("n", "<c-w>h", function()
		require("tmux").move_left()
	end)
	map("n", "<c-w>j", function()
		require("tmux").move_bottom()
	end)
	map("n", "<c-w>k", function()
		require("tmux").move_top()
	end)
	map("n", "<c-w>l", function()
		require("tmux").move_right()
	end)

	set.relativenumber = false

	-- Set autocommands
	vim.api.nvim_create_augroup("userft", {})
	vim.api.nvim_create_autocmd("BufRead", {
		desc = "set gohtml to html",
		group = "userft",
		pattern = "*.gohtml",
		command = "set ft=html",
	})
	vim.api.nvim_create_autocmd("BufRead", {
		desc = "set envrc to bash",
		group = "userft",
		pattern = ".envrc*",
		command = "set ft=bash",
	})
	vim.api.nvim_create_autocmd("BufRead", {
		desc = "golang formatting",
		group = "userft",
		pattern = "*.go",
		command = "setlocal noet ts=4 sw=4 sts=4",
	})

	local load_all = require("user.load_all")
	load_all(os.getenv("HOME") .. "/.config/nvim/lua/user/ft")
end
