local P = {
    "nvim-lualine/lualine.nvim",
}

function P.config()
    local lualine = require('lualine')
    lualine.setup({
        theme = 'auto',
        disabled_filetypes = { 'NVimTree', 'dapui_breakpoints' },
        options = {
            -- if we want to disable for any other filetype just :echo &ft to get the name
            ignore_focus = {
                "dapui_watches", "dapui_breakpoints",
                "dapui_scopes", "dapui_console",
                "dapui_stacks", "dap-repl"
            }
        }
    })
end

return P
