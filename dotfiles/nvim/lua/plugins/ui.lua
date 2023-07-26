return {
    {
        "goolord/alpha-nvim",
        event = 'VimEnter',
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
                dashboard.button("r", "󰙰  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
            }

            local function footer()
                -- NOTE: requires the fortune-mod package to work
                -- local handle = io.popen("fortune")
                -- local fortune = handle:read("*a")
                -- handle:close()
                -- return fortune
                return ""
            end

            dashboard.section.footer.val = footer()

            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "Include"
            dashboard.section.buttons.opts.hl = "Keyword"

            dashboard.opts.opts.noautocmd = true
            require('alpha').setup(dashboard.opts)
        end,
    },
    {
        'rcarriga/nvim-notify',
        opts = {},
        config = function()
            vim.notify = require("notify")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require('lualine').setup({
                -- options = {
                --     theme = 'rose-pine'
                -- }
            })
        end
    },
    {
        "j-hui/fidget.nvim",
        tag = 'legacy',
        config = function ()
            require("fidget").setup()
        end

    },
    { 'Mofiqul/dracula.nvim' },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('bufferline').setup({
                options = {
                    indicator = {
                        icon = ' ',
                    },
                    show_close_icon = false,
                    tab_size = 0,
                    max_name_length = 25,
                    offsets = {
                        {
                            filetype = 'NvimTree',
                            text = '  Files',
                            highlight = 'StatusLine',
                            text_align = 'left',
                        },
                    },
                    separator_style = 'thin',
                    modified_icon = '',
                    custom_areas = {
                        left = function()
                            return {
                                { text = '    ', fg = '#8fff6d' },
                            }
                        end,
                    },
                },
                highlights = {
                    fill = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    background = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    tab = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    tab_close = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    close_button = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                        fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
                    },
                    close_button_visible = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                        fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
                    },
                    close_button_selected = {
                        fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
                    },
                    buffer_visible = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    modified = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    modified_visible = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    duplicate = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    duplicate_visible = {
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    separator = {
                        fg = { attribute = 'bg', highlight = 'StatusLine' },
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                    separator_selected = {
                        fg = { attribute = 'bg', highlight = 'StatusLine' },
                        bg = { attribute = 'bg', highlight = 'Normal' }
                    },
                    separator_visible = {
                        fg = { attribute = 'bg', highlight = 'StatusLine' },
                        bg = { attribute = 'bg', highlight = 'StatusLine' },
                    },
                },
            })
        end
    }
}
