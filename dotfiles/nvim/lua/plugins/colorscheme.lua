local P = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
}

function P.config()
    require('tokyonight').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = false,    -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark",                   -- style for sidebars, see below
            floats = "dark",                     -- style for floating windows
        },
        sidebars = { "qf", "help", "terminal" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,                    -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false,        -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true,                     -- dims inactive windows
        lualine_bold = true,                     -- When `true`, section headers in the lualine theme will be bold
        on_highlights = function(hl, c)
            hl.CursorLine = { bg = c.bg_dark, blend = 10 }
            hl.StatusLine = { fg = c.blue0, bg = c.blue0, blend = 10 }
            hl.ColorColumn = { bg = c.blue }
        end
    })
    vim.cmd [[ colorscheme tokyonight-storm ]]
end

return P
