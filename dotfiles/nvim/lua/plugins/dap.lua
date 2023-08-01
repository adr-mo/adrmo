return {
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
                args = { "/Users/Adrien/.vscode/extensions/xdebug.php-debug-1.33.0/out/phpDebug.js" },
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
