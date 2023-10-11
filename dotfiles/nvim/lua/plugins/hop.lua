return {
    -- no longer maintained maybe look at https://github.com/folke/flash.nvim
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function ()
        -- place this in one of your configuration file(s)
        local hop = require('hop')
        local directions = require('hop.hint').HintDirection
        vim.keymap.set('', 's', '<cmd>:HopWord<cr>', {remap=true})
        hop.setup({})
    end,
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
}
