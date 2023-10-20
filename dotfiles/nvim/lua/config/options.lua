local option = vim.opt

option.relativenumber = true -- display relative line numbers
option.number = true -- display numbers
option.tabstop = 4 -- 1 tab = 4 spaces behaviour
option.shiftwidth = 4 -- Set amount of space characters, when we press '<' or '>'
option.expandtab = true -- use spaces by default
option.autoindent = true
option.wrap = false -- do not wrap lines
option.ignorecase = true -- specific search configuration
option.smartcase = true -- specific search configuration
option.cursorline = true -- show cursorline
option.termguicolors = true -- appearance settings
option.background = 'dark' -- appearance settings
option.signcolumn = 'yes' -- appearance settings
option.backspace = 'indent,eol,start'
option.clipboard:append('unnamedplus') -- use system clipboard as default register
option.splitright = true -- split windows direction settings
option.splitbelow = true -- split windows direction settings
option.iskeyword:append("-") -- consider string-string as whole word
option.timeoutlen = 500 -- Time to wait for keymap
option.updatetime = 200 -- Time for CursorHold
option.backup = false -- no backup
option.writebackup = false -- no backup
option.undofile = false -- no undo staging
option.swapfile = false -- no swap file
option.autoread = true -- reload file is changed outside nvim
vim.cmd([[ set colorcolumn=80,120 ]]) -- column cursor 80 for commits / 120 for code 
vim.cmd([[set nofoldenable ]]) -- disable code folding
