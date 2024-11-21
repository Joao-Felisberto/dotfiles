--require("luasnip.loaders.from_snipmate").load({ path = { "$HOME/.config/nvim/snippets/" } })

--local ls = require("luasnip")
--vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
----vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
----vim.keymap.set({"i", "s"}, "<S-TAB>", function() ls.jump(-1) end, {silent = true})
--vim.keymap.set({"i", "s"}, "<TAB>", function() ls.jump( 1) end, {silent = true})
--vim.keymap.set({"i", "s"}, "<C-E>", function() ls.jump(-1) end, {silent = true})

----vim.keymap.set({"i", "s"}, "<C-E>", function()
        ----if ls.choice_active() then
                ----ls.change_choice(1)
        ----end
----end, {silent = true})

