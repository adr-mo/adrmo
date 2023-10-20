-- set space key as leader key
vim.g.mapleader = ' '

local map = vim.keymap.set

map('n', 'x', '"_x') -- don't put cut characters in register
map('n', 'r', '"_r') -- don't put cut characters in register
map({ 'i', 'n' }, '<ESC>', [[<Cmd>noh<CR><ESC>]], { desc = "Escape and clear search highlighting" })
map('i', 'jk', '<ESC>') -- use jk to exit insert mode
map("n", "J", "mzJ`z") -- Remap the join line action
map("n", "Y", "ggVGy") -- copy the whole file
map("n", "n", "nzzzv") -- keep display buffer centered when cycling through searches
map("n", "N", "Nzzzv") -- keep display buffer centered when cycling through searches
map('n', '<leader>sv', '<C-w>v', { desc = 'Vertical split'}) -- split window vertically
map('n', '<leader>sh', '<C-w>s', { desc = 'Horizontal split'}) -- split window horizontally
map('n', '<leader>se', '<C-w>=', { desc = 'Equal size splits'}) -- make split windows equal width & height
map('n', '<leader>sx', '<cmd>close<CR>') -- close current split window
map('n', '<leader>to', '<cmd>tabnew<CR>') -- open new tab
map('n', '<leader>tx', '<cmd>tabclose<CR>') -- close current tab
map('n', '<leader>tn', '<cmd>tabn<CR>') --  go to next tab
map('n', '<leader>tp', '<cmd>tabp<CR>') --  go to previous tab
map('v', '<', '<gv') -- Reselect visual selection after indenting because annoying
map('v', '>', '>gv') -- Reselect visual selection after indenting because annoying
-- Save using CTRL-s and exit insert mode 
map({'n', 'i'}, '<C-s>', '<Cmd>w<CR><ESC>', { desc = "Save file", silent = true })
map({'n', 'i'}, '<C-sa>', '<Cmd>wa<CR><ESC>', { desc = "Save all files", silent = true })
map('n', '<C-q>', '<cmd> %bd|e#|bd# <CR>', { desc = 'Delete buffers except the current one' })
-- map('n', '<C-Q>', '<cmd> bufdo bd <CR>', { desc = 'Delete all buffers' })
map('n', '<leader>z', ':ZenMode<CR>', { desc = 'Zenmode', noremap = true, silent = true }) -- Enable zenmode (plugin)
map('i', '<C-h>', '<Left>') -- Move around buffer in insert mode
map('i', '<C-l>', '<Right>') -- Move around buffer in insert mode
map('i', '<C-k>', '<Up>') -- Move around buffer in insert mode
map('i', '<C-j>', '<Down>') -- Move around buffer in insert mode
map('t', '<C-t>', '<C-\\><C-n>') -- Exit the terminal insert mode with ESC
