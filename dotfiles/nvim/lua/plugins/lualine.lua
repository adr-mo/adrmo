local Plugin = {
    "nvim-lualine/lualine.nvim",
}

function Plugin.config()
    local lualine = require('lualine')

    lualine.setup({
        options = {
            theme = 'auto',
            component_separators = '󰇙',
            section_separators = { left = '', right = '' },
            disabled_filetypes = { 'NVimTree', 'dapui_breakpoints' },
            -- if we want to disable for any other filetype just :echo &ft to get the name
            ignore_focus = {
                "dapui_watches", "dapui_breakpoints",
                "dapui_scopes", "dapui_console",
                "dapui_stacks", "dap-repl"
            }
        },
    })
end

return Plugin
