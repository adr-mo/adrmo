-- set space key as leader key
vim.g.mapleader = ' '

local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>')

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- window management
keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab keymap.set('n', '<leader>ff', '<cmd>lua require('telescope.builtin').buffers()<cr>') keymap.set('n', '<leader>ff', '<cmd>lua require('telescope.builtin').find_files()<cr>') keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>') keymap.set('n', '<leader>fF', '<cmd>Telescope live_grep<cr>') keymap.set('n', '<leader>ft', '<cmd>Telescope treesitter<cr>') keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>') keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>') keymap.set('n', '<leader>fR', '<cmd>Telescope registers<cr>')

-- Reselect visual selection after indenting because annoying
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- save
keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true })

-- hardcore mod ON / remove the keys for arrows navigation
