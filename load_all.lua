local fileExtension = ".lua"

local function is_lua_file(filename)
	return filename:sub(-#fileExtension) == fileExtension
end

return function(path)
	local scan = require("plenary.scandir")
	for _, file in ipairs(scan.scan_dir(path, { depth = 0 })) do
		if is_lua_file(file) then
			dofile(file)
		end
	end
end
