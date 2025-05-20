function ColorMyPencils(color)
	color = color or 'rose-pine'
	vim.o.background = 'dark'
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

	-- remove all italics!
	for _, group in ipairs(vim.fn.getcompletion('@', 'highlight')) do
		local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
		if ok then
			hl.italic = nil
			vim.api.nvim_set_hl(0, group, hl)
		end
	end
end

ColorMyPencils()
