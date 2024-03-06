local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local function _php_console_cc()
    local Terminal = require('toggleterm.terminal').Terminal
    local term = Terminal:new({
        cmd = 'docker exec -ti centreon-dev sudo -u apache /usr/bin/php /usr/share/centreon/bin/console c:c',
        direction = 'float',
        close_on_exit = false
    })
    term:toggle()
end

local function createMenu(title, elements, callback)
    return Menu({
            position = "50%",
            size = {
                width = 50,
                height = 30,
            },
            border = {
                style = "single",
                text = {
                    top = title,
                    top_align = "center",
                },
            },
            win_options = {
                winhighlight = "Normal:Normal,FloatBorder:Normal",
            },
        },
        {
            lines = elements,
            max_width = 20,
            keymap = {
                focus_next = { "j", "<Down>", "<Tab>" },
                focus_prev = { "k", "<Up>", "<S-Tab>" },
                close = { "<Esc>", "<C-c>" },
                submit = { "<CR>", "<Space>" },
            },
            on_close = function()
                print("Development menu closed.")
            end,
            on_submit = function(item)
                print('Selected ' .. item.id)
                -- callback(item.id)
            end,
        })
end

local function splitString (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

local function _docker_cp()
    -- get a temporary file name
    local tab = splitString(vim.fn.fnamemodify(vim.fn.expand("%"), ":~:."), '/')
    table.remove(tab)
    table.remove(tab)

print(table.concat(tab,"/"))
    local containers = {}
    local n = os.tmpname()
    -- execute a command
    os.execute("docker ps --format \"{{.ID}} - {{.Names}}\" > " .. n)

    -- display output
    local i = 1
    for line in io.lines(n) do
        table.insert(containers, Menu.item(line, { id = i }));
        i = i + 1
    end

    -- remove temporary file
    os.remove(n)
    local list = createMenu('Containers', containers, nil)
    list:mount()
end

local function error_message(msg)
    local Popup = require("nui.popup")

    local popup = Popup({
        position = "50%",
        size = {
            width = 50,
            height = 1,
        },
        enter = true,
        focusable = true,
        zindex = 50,
        relative = "win",
        border = {
            padding = {
                top = 2,
                bottom = 2,
                left = 3,
                right = 3,
            },
            style = "rounded",
            text = {
                top = " Error ",
                top_align = "center",
            },
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
    })
    popup.border:set_highlight("Error")


    -- mount/open the component
    popup:mount()

    -- unmount component when cursor leaves buffer
    popup:on(event.BufLeave, function()
        popup:unmount()
    end)

    -- set content
    vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { msg })
end

local actions = {
    [1] = phpstan,
    [2] = _phpcs_fixer,
    [3] = _docker_cp,
    [4] = _php_console_cc,
    [5] = _php_console_dr,
    [6] = _docker_enter,
    [7] = _docker_logs,
}

local function _action(id)
    local action = actions[id]
    if (action) then
        action()
    else
        error_message("Action not supported yet !")
    end
end

local development_menu = Menu({
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
        Menu.separator(" PHP ", {
            char = "*",
            text_align = "center",
        }),
        Menu.item("PHPStan", { id = 1 }),
        Menu.item("PHP CS Fixer", { id = 2 }),
        Menu.separator(" Docker ", {
            char = "*",
            text_align = "center",
        }),
        Menu.item("Copy on docker", { id = 3 }),
        Menu.item("PHP console: clear cache", { id = 4 }),
        Menu.item("PHP console: debug router", { id = 5 }),
        Menu.item("Enter container", { id = 6 }),
        Menu.item("See development logs (SQL + PHP)", { id = 7 }),
    },
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
    },
    on_close = function()
        print("Development menu closed.")
    end,
    on_submit = function(item)
        _action(item.id)
    end,
})

-- mount the component
development_menu:mount()
