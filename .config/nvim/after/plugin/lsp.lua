require("luasnip.loaders.from_snipmate").load({ path = { "$HOME/.config/nvim/snippets/" } })

local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-D>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-S>", function() ls.jump(-1) end, {silent = true})

-----------------------------------------------------------------------------------------------

local lsp = require('lsp-zero').preset({
	set_lsp_keymaps = true,
	--manage_nvim_cmp = true,
})
--local luasnip = require('luasnip')
local cmp = require('cmp')

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- lsp.preset("recommended")

lsp.ensure_installed({
	-- 'sumneko_lua',
	'rust_analyzer',
	'jedi_language_server'
})

lsp.on_attach(function(_, bufnr) -- _ = client
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-E>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm(),
	})
})

lsp.setup()

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'cmp_luasnip'},
		{name = 'cmp_'},
		{name = 'cmp_luasnip'},
	  }
})
