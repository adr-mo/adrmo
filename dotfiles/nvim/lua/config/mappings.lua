-- set space key as leader key
vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>') -- use jk to exit insert mode
keymap.set('n', '<leader>nh', ':nohl<CR>') -- clear search highlights
keymap.set("n", "J", "mzJ`z") -- Remap the join line action
keymap.set("n", "Y", "ggVGy") -- copy the whole file
keymap.set("n", "n", "nzzzv") -- keep display buffer centered when cycling through searches
keymap.set("n", "N", "Nzzzv") -- keep display buffer centered when cycling through searches
keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window
keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab
keymap.set('v', '<', '<gv') -- Reselect visual selection after indenting because annoying
keymap.set('v', '>', '>gv') -- Reselect visual selection after indenting because annoying
keymap.set('n', '<C-s>', '<cmd> w <CR>') -- save buffer keymap
keymap.set('n', '<C-S>', '<cmd> wa <CR>') -- save all buffers keymap
keymap.set('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true }) -- Enable zenmode (plugin)
keymap.set('n', '<leader>tt', "<cmd>ToggleTerm direction=float<CR>") -- Floating terminal
keymap.set('i', '<C-h>', '<Left>') -- Move around buffer in insert mode
keymap.set('i', '<C-l>', '<Right>') -- Move around buffer in insert mode
keymap.set('i', '<C-k>', '<Up>') -- Move around buffer in insert mode
keymap.set('i', '<C-j>', '<Down>') -- Move around buffer in insert mode
keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Exit the terminal insert mode with ESC
