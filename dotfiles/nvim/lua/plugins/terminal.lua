local P = {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
}

function P.config()
    local t = require('toggleterm')
    t.setup {
        start_in_insert = true,
        direction = 'float',
        shade_terminals = true,
        float_opts = {
            border = 'curved'
        },
        on_open = function()
            -- Prevent infinite calls from freezing neovim.
            -- Only set these options specific to this terminal buffer.
            vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
            vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
        end,
    }
end

return P
