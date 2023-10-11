return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = 'dawn',
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = 'main',
                bold_vert_split = true,
                dim_nc_background = true,
                disable_background = false,
                disable_float_background = false,
                disable_italics = true,

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
                    -- TelescopePromptBorder = { bg = 'panel', fg = 'pine' },
                    -- TelescopeBorder = { bg = 'panel', fg = 'pine' },
                    -- TelescopePromptNormal = { fg = 'pine', bg = 'panel' },
                    -- TelescopePromptCounter = { bg = 'panel', fg = 'pine' },
                    -- TelescopePromptPrefix = { fg = 'pine', bg = 'panel' },
                    -- TelescopePromptTitle = { fg = 'pine', bg = 'panel' },
                    -- TelescopePreviewTitle = { fg = 'pine', bg = 'panel' },
                    -- TelescopePreviewBorder = {
                    --     -- bg = 'rose',
                    --     fg = 'panel'
                    -- },
                    -- TelescopePreviewNormal = {
                    --     -- bg = 'rose',
                    --     fg = 'panel'
                    -- },
                    -- TelescopeResultsTitle = { fg = 'pine', bg = 'panel' },
                    -- TelescopeMatching = { fg = 'panel' },
                    -- TelescopeNormal = { bg = 'panel' },
                    -- TelescopeSelection = { bg = 'pine' },
                    -- TelescopeSelectionCaret = { fg = 'pine' },
                    -- TelescopeResultsNormal = { bg = 'panel' },
                    -- TelescopeResultsBorder = { bg = 'panel', fg = 'pine' },
                    -- Blend colours against the "panel" background
                    CursorLine = { bg = 'rose', blend = 30 },
                    StatusLine = { fg = 'rose', bg = 'rose', blend = 10 },

                    -- By default each group adds to the existing config.
                    -- If you only want to set what is written in this config exactly,
                    -- you can set the inherit option:
                    Search = { bg = 'pine', inherit = false },
                }
            })

            -- Set colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end
    }
}
