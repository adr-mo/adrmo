local P = {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    }
}

function P.config()
    vim.keymap.set("n", "<F6>", ":lua require'dapui'.toggle()<CR>")
    vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>")
    vim.keymap.set("n", "<F8>", ":lua require'dap'.continue()<CR>")
    vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()<CR>")
    vim.keymap.set("n", "<F3>", ":lua require'dap'.step_into()<CR>")
    vim.keymap.set("n", "<F4>", ":lua require'dap'.step_out()<CR>")
    vim.keymap.set("n", "<F9>", ":lua require('dapui').eval()<CR>")
    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
    end

    dapui.setup({
        {
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                max_height = 0.9,
                max_width = 0.5,    -- Floats will be treated as percentage of your screen.
                border = 'rounded', -- Border style. Can be 'single', 'double' or 'rounded'
                mappings = {
                    close = { 'q', '<Esc>' },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts = {
                {
                    elements = {
                        { id = 'scopes',      size = 0.33 },
                        { id = 'breakpoints', size = 0.17 },
                        { id = 'stacks',      size = 0.25 },
                        { id = 'watches',     size = 0.25 },
                    },
                    position = "left",
                    size = 0.33
                },
                {
                    elements = {
                        { id = 'repl',    size = 0.45 },
                        { id = 'console', size = 0.55 },
                    },
                    size = 0.27,
                    position = "bottom",
                }
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        }
    })

    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/Users/Adrien/.vscode/extensions/xdebug.php-debug-1.34.0/out/phpDebug.js" },
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

    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

    dap.defaults.fallback.terminal_win_cmd = "20split new"

    -- require("nvim-dap-virtual-text").setup({
    --     enabled = true,                 -- enable this plugin (the default)
    --     enabled_commands = true,        -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    --     highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    --     highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    --     show_stop_reason = true,        -- show stop reason when stopped for exceptions
    --     commented = false,              -- prefix virtual text with comment string
    --     only_first_definition = true,   -- only show virtual text at first definition (if there are multiple)
    --     all_references = true,         -- show virtual text on all all references of the variable (not only definitions)
    --     clear_on_continue = false,      -- clear virtual text on "continue" (might cause flickering when stepping)
    --     --- A callback that determines how a variable is displayed or whether it should be omitted
    --     --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --     --- @param buf number
    --     --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --     --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --     --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --     --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    --     display_callback = function(variable, buf, stackframe, node, options)
    --         if options.virt_text_pos == 'inline' then
    --             return ' = ' .. variable.value
    --         else
    --             return variable.name .. ' = ' .. variable.value
    --         end
    --     end,
    --     -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    --     virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
    --
    --     -- experimental features:
    --     all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    --     virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    --     virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
    --     -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    -- })
end

return P
