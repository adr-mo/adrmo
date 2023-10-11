local opt = vim.opt

opt.relativenumber = true -- display relative line numbers
opt.number = true -- display numbers
opt.tabstop = 4 -- tab behaviour
opt.shiftwidth = 4 -- 1 tab = 4 spaces
opt.expandtab = true
opt.autoindent = true
opt.wrap = false -- do not wrap lines
opt.ignorecase = true -- specific search configuration
opt.smartcase = true -- specific search configuration
opt.cursorline = true -- show cursorline
opt.termguicolors = true -- appearance settings
opt.background = 'dark' -- appearance settings
opt.signcolumn = 'yes' -- appearance settings
opt.backspace = 'indent,eol,start'
opt.clipboard:append('unnamedplus') -- use system clipboard as default register
opt.splitright = true -- split windows direction settings
opt.splitbelow = true -- split windows direction settings
opt.iskeyword:append("-") -- consider string-string as whole word
opt.timeoutlen = 500 -- Time to wait for keymap
opt.updatetime = 200 -- Time for CursorHold
opt.backup = false -- no backup
opt.writebackup = false -- no backup
opt.undofile = false -- no undo staging
opt.swapfile = false -- no swap file
vim.cmd([[ set colorcolumn=80,120 ]]) -- column cursor 80 for commits / 120 for code 
vim.cmd([[set nofoldenable ]]) -- disable code folding
