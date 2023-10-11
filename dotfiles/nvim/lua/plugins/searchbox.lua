return {
    -- take a look at https://github.com/romgrk/searchbox.nvim
    'VonHeikemen/searchbox.nvim',
    dependencies = {
        { 'MunifTanjim/nui.nvim' }
    },
    init = function()
        require('searchbox').setup({
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
                        top = ' Search ',
                        top_align = 'center',
                    },
                },
                win_options = {
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                },
            },
            hooks = {
                before_mount = function(input)
                    -- code
                end,
                after_mount = function(input)
                    -- code
                end,
                on_done = function(value, search_type)
                    -- code
                end
            }
        })
        vim.keymap.set('n', '<leader>sr', ':SearchBoxReplace<CR>')
        vim.keymap.set('n', '/', ':SearchBoxSimple<CR>')
    end
}
