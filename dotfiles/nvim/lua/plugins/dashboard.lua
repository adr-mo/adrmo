local P = {
    'glepnir/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
}

function P.config()
    local d = require('dashboard')
    d.setup({
        theme = 'doom',
        config = {
            header = {
                [[]],
                [[]],
                [[]],
                [[]],
                [[]],
                [[]],
                [[⣰⣿⣿⣿⣷⡀⠀⠀⢸⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⣿⣿⣿⣿⣿⣿⣄⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⣿⣿⣿⠈⢿⣿⣿⣦⢸⣿⣿⡇⠀⣠⠴⠒⠢⣄⠀⠀⣠⠴⠲⠦⣄⠐⣶⣆⠀⠀⢀⣶⡖⢰⣶⠀⢰⣶⣴⡶⣶⣆⣴⡶⣶⣶⡄]],
                [[⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⡇⢸⣁⣀⣀⣀⣘⡆⣼⠁⠀⠀⠀⠘⡇⠹⣿⡄⠀⣼⡿⠀⢸⣿⠀⢸⣿⠁⠀⢸⣿⡏⠀⠀⣿⣿]],
                [[⠹⣿⣿⠀⠀⠀⠙⣿⣿⣿⡿⠃⢸⡀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢀⡏⠀⢻⣿⣸⣿⠁⠀⢸⣿⠀⢸⣿⠀⠀⢸⣿⡇⠀⠀⣿⣿]],
                [[⠀⠈⠻⠀⠀⠀⠀⠈⠿⠋⠀⠀⠈⠳⢤⣀⣠⠴⠀⠈⠧⣄⣀⡠⠞⠁⠀⠀⠿⠿⠃⠀⠀⢸⣿⠀⢸⣿⠀⠀⠸⣿⡇⠀⠀⣿⡿]],
                [[]],
                [[]],
                [[]],
                [[]],
                [[]],
            },
            center = {
                {
                    icon = ' ',
                    desc = 'New file',
                    desc_hl = 'String',
                    key = 'n',
                    action = 'ene | startinsert'
                },
                {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find File',
                    desc_hl = 'String',
                    key = 'f',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    action = 'Telescope find_files'
                },
                {
                    icon = ' ',
                    desc = 'Explorer',
                    key = 'e',
                    keymap = 'SPC e',
                    action = "NvimTreeOpen"
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
                    key = 'g',
                    keymap = 'SPC g',
                    action = "LazyGit"
                },
                {
                    icon = ' ',
                    desc = 'Lazy',
                    key = 'l',
                    action = "Lazy"
                },
                {
                    icon = ' ',
                    desc = 'Projects',
                    key = 'p',
                    action = "Telescope projects"
                },
                {
                    icon = '󰩈 ',
                    desc = 'Exit',
                    key = 'q',
                    action = "qa"
                },
            },
            footer = {} --your footer
        }
    })
end

return P
