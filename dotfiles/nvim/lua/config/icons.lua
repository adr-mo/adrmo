--[[
  Description: Icon definitions
  See: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/icons.lua
]]

return {
    kind = {
        Class = "󰠱",
		Color = "󰏘",
		Constant = "󰏿",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "󰇽",
		File = "󰈙",
		Folder = "󰉋",
		Fragment = "",
		Function = "󰊕",
		Interface = "",
		Implementation = "",
		Keyword = "󰌋",
        Method = '',
		Module = "",
		Namespace = "󰌗",
		Number = "",
		Operator = "󰆕",
		Package = "",
		Property = "󰜢",
		Reference = "",
		Snippet = "",
		Struct = "",
		Text = "󰉿",
		TypeParameter = "󰅲",
		Undefined = "",
		Unit = "",
		Value = "󰎠",
		Variable = "",
		-- ccls-specific icons.
		TypeAlias = "",
		Parameter = "",
		StaticMethod = "",
		Macro = "",
    },
	dap = {
		Breakpoint = "󰝥",
		BreakpointCondition = "󰟃",
		BreakpointRejected = "",
		LogPoint = "",
		Pause = "",
		Play = "",
		RunLast = "↻",
		StepBack = "",
		StepInto = "󰆹",
		StepOut = "󰆸",
		StepOver = "󰆷",
		Stopped = "",
		Terminate = "󰝤",
	},
    debug = {
        Expanded = '',
        Collapsed = '',
        Circular = '',
    },
    git = {
        LineAdded = '',
        LineModified = '',
        LineRemoved = '',
        FileDeleted = '✗',
        FileIgnored = '◌',
        FileRenamed = '➜',
        FileStaged = '✓',
        FileUnmerged = '',
        FileUnstaged = '★',
        FileUntracked = '?',
        FileConflict = '',
        Diff = '',
        Repo = '',
        Octoface = '',
        Branch = '',
		Git = "󰊢",
	},
    lsp = {
        Server = ' ',
        Lsp = '',
        Lua = '',
        Latex = '',
        Test = '󰙨',
		Buffer = "",
		Luasnip = "󰃐",
		Path = "",
		Spell = "󰓆",
		Tmux = "",
		Treesitter = "",
		Undefined = "",
    },
    file = {
        ReadOnly = '',
        New = '',
        Modified = '●',
        Path = '',
    },
    diagnostics = {
        Diagnostic = "󰒡",
        Debug = '',
        Error = "󰅚",
        Warning = "󰀪",
        Info = "",
        Hint = "󰌶",
        Trace = '󰙈',
    },
    ui = {
        ChevronRight = "",
        Separator = "",
        RightPill = '',
        LeftPill = '',
        VerticalLine = '|',
        VerticalLineThick = '┃',
        VerticalDottedLine = '',
        VerticalDottedLineThick = '󰇙',
        Telescope = "",
    }
}
