return {
	{
		'nvim-tree/nvim-tree.lua',
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- optionally enable 24-bit colour
			vim.opt.termguicolors = true
			vim.keymap.set('n', '<leader>e', function()
				require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
			end
		)
		require("nvim-tree").setup {}
	end,
	},
}
