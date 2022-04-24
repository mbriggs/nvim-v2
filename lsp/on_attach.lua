return function(client, bufnr)
	-- dont use main LSP for formatting, use null-ls
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	-- vim.api.nvim_create_augroup("userlsp", {})
	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	desc = "show diagnostic on pause",
	-- 	group = "userlsp",
	-- 	pattern = "<buffer>",
	-- 	callback = function()
	-- 		vim.diagnostic.open_float({ scope = "c" })
	-- 	end,
	-- })

	-- vim.api.nvim_create_autocmd("CursorHoldI", {
	-- 	desc = "show diagnostic on pause in insert",
	-- 	group = "userlsp",
	-- 	pattern = "<buffer>",
	-- 	command = "silent! lua vim.lsp.buf.signature_help()",
	-- })
end
