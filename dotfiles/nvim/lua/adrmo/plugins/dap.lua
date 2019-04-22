-- https://github.com/xdebug/vscode-php-debug/releases
-- Extract the vsix content
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
