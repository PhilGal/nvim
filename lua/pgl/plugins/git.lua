return {
	-- Git
	{ 'tpope/vim-fugitive',
	config = function() 
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end
},
{ 'sindrets/diffview.nvim', lazy = false },
}
