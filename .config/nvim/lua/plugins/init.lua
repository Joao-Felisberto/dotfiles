return {
	-- color schemes
	"jeffkreeftmeijer/vim-dim",
	"chriskempson/base16-vim",

	-- writing aids
	"scrooloose/nerdcommenter",
	"airblade/vim-gitgutter",
	
	-- treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- nerdtree
	"scrooloose/nerdtree",
	"Xuyuanp/nerdtree-git-plugin",
	"ryanoasis/vim-devicons",

	-- telescope
	{
		"nvim-telescope/telescope.nvim", 
		dependencies = {
			"nvim-lua/plenary.nvim",
		}
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	
	-- Rust
	"mrcjkb/rustaceanvim",
}
