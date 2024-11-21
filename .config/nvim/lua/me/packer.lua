-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- optional
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use 'scrooloose/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
	use 'ryanoasis/vim-devicons'
	use 'scrooloose/nerdcommenter'
	use 'airblade/vim-gitgutter'

	use 'simrat39/rust-tools.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'

	use 'm4xshen/autoclose.nvim'

	-- https://github.com/ray-x/go.nvim
	--use 'ray-x/go.nvim'
	--use 'ray-x/guihua.lua' -- recommended if need floating window support
	--use 'neovim/nvim-lspconfig'
	--use 'nvim-treesitter/nvim-treesitter'

	use {'kaarmu/typst.vim', ft = {'typst'}}
end)
