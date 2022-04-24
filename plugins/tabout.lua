return function()
	require("tabout").setup({
		tabkey = "", -- key to trigger tabout, set to an empty string to disable
		backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
		act_as_tab = true, -- shift content if tab out is not possible
		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		enable_backwards = true, -- well ...
		completion = true, -- if the tabkey is used in a completion pum
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
			{ open = "do", close = "end" },
		},
		ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
		exclude = {}, -- tabout will ignore these filetypes
	})

	local function replace_keycodes(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	function _G.tab_binding()
		if require("cmp").visible() then
			return replace_keycodes("<C-n>")
		elseif require("luasnip").expand_or_jumpable() then
			return replace_keycodes("<Plug>(luasnip-expand-or-jump)")
		else
			return replace_keycodes("<Plug>(Tabout)")
		end
	end

	function _G.s_tab_binding()
		if require("cmp").visible() then
			return replace_keycodes("<C-p>")
		elseif require("luasnip").jumpable(-1) then
			return replace_keycodes("<Plug>(luasnip-jump-prev)")
		else
			return replace_keycodes("<Plug>(TaboutBack)")
		end
	end

	vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", { expr = true })
	vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", { expr = true })
end
