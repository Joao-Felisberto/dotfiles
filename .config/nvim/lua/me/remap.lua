vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-h>', 'b', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', 'e', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<C-l>', [[/\([.,; ]\|^$\)\|\%$<CR>]], { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', [[?\([.,; ]\|^$\)<CR>]], { noremap = true })

-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-Up>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-Down>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-h>', '<C-Left>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<C-Right>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<C-Up>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<C-Down>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true})

vim.api.nvim_set_keymap('n', 'J', '10j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '10k', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader> ', '<plug>NERDCommenterToggle', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader> ', '<plug>NERDCommenterToggle', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<leader> ', '<plug>NERDCommenterToggle', {noremap = true, silent = true})

