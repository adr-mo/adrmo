return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local db = require('dashboard')
        db.setup({
            theme = 'doom',
                -- dashboard.button("f", "  Find file", ":Telescope find_files theme=ivy<CR>"),
                -- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                -- dashboard.button("p", "  Find project", ":Telescope projects theme=ivy<CR>"),
                -- dashboard.button("r", "󰙰  Recently used files", ":Telescope oldfiles theme=ivy<CR>"),
                -- dashboard.button("t", "󰊄  Find text", ":Telescope live_grep theme=ivy<CR>"),
                -- dashboard.button('b', "  Browse directory", ":Telescope file_browser path=%:p:h theme=ivy<CR>"),
                -- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                -- dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
            config = {
                header = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    ' ##### ###### ### ### ###### #####   ######  ####  ### ### ',
                    '##  ##  ##  #  ##  #  # ## #  ## ##   ##  # ##  ##  ##  #  ',
                    '##      ##     ### #    ##    ## ##   ##    ##  ##  ### #  ',
                    '##      ###    # # #    ##    ####    ###   ##  ##  # # #  ',
                    '##      ##     # ###    ##    ## #    ##    ##  ##  # ###  ',
                    '### ##  ##  #  #  ##    ##    ## ##   ##  # ##  ##  #  ##  ',
                    ' ####  ###### ###  #   ####  ### ### ######  ####  ###  #  ',
                    ''
                },
                center = {
                -- dashboard.button("f", "  Find file", ":Telescope find_files theme=ivy<CR>"),
                -- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                -- dashboard.button("p", "  Find project", ":Telescope projects theme=ivy<CR>"),
                -- dashboard.button("r", "󰙰  Recently used files", ":Telescope oldfiles theme=ivy<CR>"),
                -- dashboard.button("t", "󰊄  Find text", ":Telescope live_grep theme=ivy<CR>"),
                -- dashboard.button('b', "  Browse directory", ":Telescope file_browser path=%:p:h theme=ivy<CR>"),
                -- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                -- dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find File           ',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = 'SPC f f',
                        key_hl = 'Number',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find Project           ',
                        desc_hl = 'String',
                        key = 'p',
                        keymap = 'SPC f p',
                        key_hl = 'Number',
                        action = 'Telescope projects'
                    },
                    {
                        icon = '󰊄 ',
                        icon_hl = 'Title',
                        desc = 'Find Text           ',
                        desc_hl = 'String',
                        key = 't',
                        keymap = 'SPC f g',
                        key_hl = 'Number',
                        action = 'Telescope live_grep'
                    },
                    {
                        icon = '󰩈 ',
                        icon_hl = 'Title',
                        desc = 'Quit Neovim           ',
                        desc_hl = 'String',
                        key = 'q',
                        key_hl = 'Number',
                        action = ':qa'
                    },
                },
                footer = {} --your footer
            }
        })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
