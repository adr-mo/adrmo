return {
    {
        "folke/trouble.nvim",
        init = function ()
            vim.keymap.set("n", "<leader>T", "<cmd>TroubleToggle document_diagnostics<cr>")
        end,
        config = function ()
            require("trouble").setup({
                position = "bottom", -- position of the list can be: bottom, top, left, right
                height = 10, -- height of the trouble list when position is top or bottom
                width = 50, -- width of the list when position is left or right
                icons = true, -- use devicons for filenames
                mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
                fold_open = "", -- icon used for open folds
                fold_closed = "", -- icon used for closed folds
                group = true, -- group results by file
                padding = true, -- add an extra new line on top of the list
                action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example:
                    -- close = {},
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                    open_split = { "<c-x>" }, -- open buffer in new split
                    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                    open_tab = { "<c-t>" }, -- open buffer in new tab
                    jump_close = { "o" }, -- jump to the diagnostic and close the list
                    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                    switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
                    toggle_preview = "P", -- toggle auto_preview
                    hover = "K", -- opens a small popup with the full multiline message
                    preview = "p", -- preview the diagnostic location
                    close_folds = { "zM", "zm" }, -- close all folds
                    open_folds = { "zR", "zr" }, -- open all folds
                    toggle_fold = { "zA", "za" }, -- toggle fold of current file
                    previous = "k", -- previous item
                    next = "j", -- next item
                },
                indent_lines = true, -- add an indent guide below the fold icons
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = false, -- automatically close the list when you have no diagnostics
                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                auto_fold = false, -- automatically fold a file trouble list at creation
                auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "",
                },
                use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
            })
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        init = function ()
            vim.keymap.set("n", "<F6>", ":lua require'dapui'.toggle()<CR>")
            vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
            vim.keymap.set("n", "<F8>", ":lua require'dap'.continue()<CR>")
            vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>")
            vim.keymap.set("n", "<F3>", ":lua require'dap'.step_into()<CR>")
            vim.keymap.set("n", "<F4>", ":lua require'dap'.step_out()<CR>")
            vim.keymap.set("n", "<F9>", ":lua require('dapui').eval()<CR>")
        end,
        config = function ()
            local dap = require("dap")

            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = { "/Users/Adrien/.vscode/extensions/xdebug.php-debug-1.32.1/out/phpDebug.js" },
            }

            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for xdebug",
                    hostname = "0.0.0.0",
                    port = "9001",
                    log = true,
                    serverSourceRoot = "/usr/share/centreon/",
                    localSourceRoot = "/Users/Adrien/workspace/code/centreon/centreon/",
                },
            }

            local sign = vim.fn.sign_define

            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
            dap.defaults.fallback.terminal_win_cmd = "20split new"
            require("nvim-dap-virtual-text").setup()
            require("dapui").setup()

        end
    }
}
