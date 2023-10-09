local opt = vim.opt

-- display line relative line numbers
opt.relativenumber = true
opt.number = true

-- configure the tab behaviour and width
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- do not wrap lines
opt.wrap = false

-- specific search configuration
opt.ignorecase = true
opt.smartcase = true

-- show cursorline
opt.cursorline = true

-- appearance settings
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

opt.backspace = 'indent,eol,start'

-- use system clipboard as default register
opt.clipboard:append('unnamedplus')

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider string-string as whole word
opt.iskeyword:append("-")

-- Time to wait for keymap
opt.timeoutlen = 500

-- Time for CursorHold
opt.updatetime = 200

-- Undo and backup options
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.swapfile = false
vim.cmd([[ set colorcolumn=120 ]])
vim.cmd([[set nofoldenable ]])
