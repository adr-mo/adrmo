local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local menu = Menu({
    position = "50%",
    size = {
        width = 50,
        height = 30,
    },
    border = {
        style = "single",
        text = {
            top = "[Development actions]",
            top_align = "center",
        },
    },
    win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
}, {
    lines = {
        Menu.separator("PHP Actions", {
            char = "-",
            text_align = "center",
        }),
    },
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
    },
    on_close = function()
        print("Menu Closed!")
    end,
    on_submit = function(item)
        _action(item.id)
    end,
})

-- mount the component
menu:mount()

