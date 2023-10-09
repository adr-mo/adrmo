return {
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'doom',
                config = {
                    header = {
                        '',
                        '',
                        '',
                        '',
                        '',
                        '   .aMMMb  dMMMMMP dMMMMb dMMMMMMP dMMMMb  dMMMMMP .aMMMb  dMMMMb',
                        '  dMP"VMP dMP     dMP dMP   dMP   dMP.dMP dMP     dMP"dMP dMP dMP',
                        ' dMP     dMMMP   dMP dMP   dMP   dMMMMK" dMMMP   dMP dMP dMP dMP ',
                        'dMP.aMP dMP     dMP dMP   dMP   dMP"AMF dMP     dMP.aMP dMP dMP  ',
                        'VMMMP" dMMMMMP dMP dMP   dMP   dMP dMP dMMMMMP  VMMMP" dMP dMP   ',
                        '',
                        '',
                        '',
                        '',
                        '',
                    },
                    center = {
                        {
                            icon = ' ',
                            icon_hl = 'Title',
                            desc = 'Find File           ',
                            desc_hl = 'String',
                            key = 'f',
                            keymap = 'SPC f f',
                            key_hl = 'Number',
                            action = 'Telescope find_files'
                        },
                        {
                            icon = '󰊄 ',
                            desc = 'Find text',
                            key = 't',
                            keymap = 'SPC f g',
                            action = "lua require('telescope.builtin').live_grep({ additional_args = { '-j1' }})"
                        },
                        {
                            icon = '󱝥 ',
                            desc = 'Recently edited',
                            key = 'r',
                            keymap = 'SPC f h',
                            action = "Telescope oldfiles"
                        },
                        {
                            icon = ' ',
                            desc = 'Lazygit',
                            key = 'l',
                            keymap = 'SPC g',
                            action = "LazyGit"
                        },
                    },
                    footer = {} --your footer
                }
            })
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
