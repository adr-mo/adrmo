return {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim'
    },
    keys = {
        { '<leader>db', "<cmd>lua require('dropbar.api').pick()<CR>" }
    },
    config = function()
        local utils = require('dropbar.utils')
        require('dropbar').setup({
            menu = {
                keymaps = {
                    ['<Tab>'] = function()
                        local menu = utils.menu.get_current()
                        if not menu then
                            return
                        end
                        local cursor = vim.api.nvim_win_get_cursor(menu.win)
                        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
                        if component then
                            menu:click_on(component, nil, 1, 'l')
                        end
                    end,
                }
            }
        })
    end
}
