local M = {}

M.contains_in = function(dictionary, target)
	for _, value in pairs(dictionary) do
		if type(value) == "string" and string.find(value, target) then
			return true
		end
	end
	return false
end

M.apply_fix_by_label = function(label)
	vim.lsp.buf.code_action({
		filter = function(labelFilter)
			return M.contains_in(labelFilter, label)
		end,
		apply = true,
	})
end

M.create_pre_write_cmd = function(pattern, callback)
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = pattern,
		callback = callback,
	})
end

M.create_autofix = function(pattern, fixes_to_apply)
	M.create_pre_write_cmd(pattern, function()
		for _, value in ipairs(fixes_to_apply) do
			M.apply_fix_by_label(value)
		end
	end)
end

return M
