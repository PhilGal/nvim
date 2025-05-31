return {
	-- fuzzy search
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			builtin.diagnostics()
			vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = 'Warnings and errors'})
			vim.keymap.set('n', '<leader>pf', function()
				builtin.find_files({
					-- include .ignore or fd config
					no_ignore = true,
					-- include .gitignore 
					no_ignore_parent = true
				})
			end)
			vim.keymap.set('n', '<leader>po', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
		end
	},
	{ 'ibhagwan/fzf-lua' },
}
