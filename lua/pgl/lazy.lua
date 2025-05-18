local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim setup
require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
 
	{
		'rose-pine/neovim',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end,
	},

	-- Status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() 
			require('lualine').setup()
		end,
	},	

	-- Syntax parser, highlighting, etc.
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- Switch between selected files quickly
	{ 'theprimeagen/harpoon' },

	-- Undo
	{ 'mbbill/undotree' },

	-- Git
	{ 'tpope/vim-fugitive' },

	-- LSP plugins (add your LSP plugins here)
	{ 'neovim/nvim-lspconfig', tag = 'v1.8.0', pin = true},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
})
