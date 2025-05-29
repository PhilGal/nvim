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
			require('rose-pine').setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = true,
				extend_background_behind_borders = true,

				styles = {
					bold = true,
					italic = false,
					transparency = true,
				}	
			})
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
	{ 'sindrets/diffview.nvim', lazy = false }, 

	-- LSP plugins (add your LSP plugins here)
	{ 'neovim/nvim-lspconfig', tag = 'v1.8.0', pin = true},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },

	-- java; 
	{ 'nvim-java/nvim-java',
		dependencies = {
			{ "mason-org/mason.nvim", version = "1.11.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
	}},

	-- file tree
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

			require("nvim-tree").setup {}
		end,
	},
})
