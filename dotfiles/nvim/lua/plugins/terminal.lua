return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    config = function()
        require('toggleterm').setup {
            start_in_insert = true,
            direction = 'float',
            shade_terminals = true,
            float_opts = {
                border = 'curved'
            },
            on_open = function()
                vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
                vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
            end,
            highlights = require("rose-pine.plugins.toggleterm")
        }
        vim.keymap.set('n', '<leader>tt', "<cmd>ToggleTerm direction=float<CR>", { desc = 'Open terminal' }) -- Floating terminal
    end
}
