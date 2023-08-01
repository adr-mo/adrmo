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
        config = function()
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
        config = function()
            require("fidget").setup()
        end

    },
    -- { 'Mofiqul/dracula.nvim' },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function ()
            local rose = require('rose-pine')
            rose.setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = 'moon',
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'main',
                bold_vert_split = false,
                dim_nc_background = true,
                disable_background = false,
                disable_float_background = false,
                disable_italics = false,

                --- @usage string hex value or named color from rosepinetheme.com/palette
                groups = {
                    background = 'base',
                    background_nc = '_experimental_nc',
                    panel = 'surface',
                    panel_nc = 'base',
                    border = 'highlight_med',
                    comment = 'muted',
                    link = 'iris',
                    punctuation = 'subtle',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    warn = 'gold',

                    headings = {
                        h1 = 'iris',
                        h2 = 'foam',
                        h3 = 'rose',
                        h4 = 'gold',
                        h5 = 'pine',
                        h6 = 'foam',
                    }
                    -- or set all headings at once
                    -- headings = 'subtle'
                },

                -- Change specific vim highlight groups
                -- https://github.com/rose-pine/neovim/wiki/Recipes
                highlight_groups = {
                    ColorColumn = { bg = 'rose' },

                    -- Blend colours against the "base" background
                    CursorLine = { bg = 'foam', blend = 10 },
                    StatusLine = { fg = 'love', bg = 'love', blend = 10 },

                    -- By default each group adds to the existing config.
                    -- If you only want to set what is written in this config exactly,
                    -- you can set the inherit option:
                    Search = { bg = 'gold', inherit = false },
                }
            })

            vim.cmd('colorscheme rose-pine')
        end
    }
    -- {
    --     'sunjon/shade.nvim',
    --     config = function()
    --         local shade = require('shade')
    --         shade.setup({
    --             overlay_opacity = 30,
    --             opacity_step = 1,
    --             keys = {
    --                 -- brightness_up    = '<C-Up>',
    --                 -- brightness_down  = '<C-Down>',
    --                 -- toggle           = '<Leader>s',
    --             }
    --         })
    --     end
    -- }
}
