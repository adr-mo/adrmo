return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local icons = require('config.icons')
        require("lualine").setup({
            options = {
                component_separators = "",
                section_separators = { left = icons.ui.VerticalBlock, right = icons.ui.VerticalBlock },
                theme = 'auto',
                disabled_filetypes = { 'alpha', 'NvimTree', 'dapui_breakpoints' },
                -- if we want to disable for any other filetype just :echo &ft to get the name
                ignore_focus = {
                    "dapui_watches", "dapui_breakpoints",
                    "dapui_scopes", "dapui_console",
                    "dapui_stacks", "dap-repl"
                }
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = {
                            left = icons.ui.VerticalBlock,
                            right = icons.ui.VerticalBlock,
                        },
                        icon = icons.ui.Neovim
                    },
                },
                lualine_b = {
                    "filename",
                },
                lualine_c = {
                    {
                        "branch",
                        icon = icons.git.Branch,
                    },
                    {
                        "diff",
                        symbols = {
                            added = icons.git.LineAdded .. " ",
                            modified = icons.git.LineModified .. " ",
                            removed = icons.git.LineRemoved .. " "
                        },
                        colored = true,
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error .. " ",
                            warn = icons.diagnostics.Warning .. " ",
                            info = icons.diagnostics.Info .. " ",
                            hint = icons.diagnostics.Hint .. " ",
                        },
                        update_in_insert = true,
                    },
                },
                -- lualine_y = { clients_lsp },
                lualine_y = {
                    {
                        "filetype",
                        icon_only = false,
                        padding = { left = 0, right = 1 },
                    }
                },
                lualine_z = {
                    { "location", separator = { left = icons.ui.VerticalBlock, right = icons.ui.VerticalBlock }, icon = "" },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            extensions = { "toggleterm", "trouble" },
        })
    end
}
