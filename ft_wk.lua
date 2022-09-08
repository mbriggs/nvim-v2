local wk = require("which-key")

local ft_map = {}

vim.cmd("autocmd FileType * lua SetWKBuffer()")
function SetWKBuffer()
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	local opts = { prefix = "<leader>", buffer = 0, mode = "n" }
	local map = ft_map[ft]

	if map ~= nil then
		map["name"] = "+Local"
		wk.register({ [","] = map }, opts)
	end
end

return function(ft, map)
	ft_map[ft] = map
end
