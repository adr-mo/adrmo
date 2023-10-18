local P = {
    -- take a look at https://github.com/romgrk/searchbox.nvim
    'VonHeikemen/searchbox.nvim',
    dependencies = {
        { 'MunifTanjim/nui.nvim' }
    },
}

function P.config()
    vim.keymap.set('n', '<leader>sr', ':SearchBoxReplace<CR>')
    local searchbox = require('searchbox')
    searchbox.setup({
        defaults = {
            reverse = false,
            exact = false,
            prompt = ' ',
            modifier = 'disabled',
            confirm = 'off',
            clear_matches = true,
            show_matches = true,
        },
        popup = {
            relative = 'win',
            position = {
                row = '50%',
                col = '50%',
            },
            size = 30,
            border = {
                style = 'rounded',
                text = {
                    top_align = 'center',
                },
            },
            win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
        },
    })
end

return P
