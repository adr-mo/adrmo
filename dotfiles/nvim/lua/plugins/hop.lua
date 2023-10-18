-- no longer maintained maybe look at https://github.com/folke/flash.nvim
local P = {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
}

function P.config()
    local hop = require('hop')
    hop.setup({
        keys = 'etovxqpdygfblzhckisuran'
    })
    vim.keymap.set('n', 's', '<cmd>:HopWord<cr>', { remap = true })
end

return P
