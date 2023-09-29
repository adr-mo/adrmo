local notifyOptions = {
    render = 'wrapped-compact',
    stages = 'slide'
}
local copyPath = function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!', 'info', notifyOptions)
end

vim.api.nvim_create_user_command("Cppath", copyPath, {})
vim.keymap.set('n', '<leader>cp', '<cmd>Cppath<CR>')

local function __make_choice(choices, actions)
    vim.ui.select(
        choices,
        {
            prompt = "Development options",
            telescope = require("telescope.themes").get_dropdown(),
        },
        function(selected)
            if actions[selected] then
                actions[selected]()
            end
        end
    )
end

local function _phpstan_toggle(input)
    require('toggleterm').exec(
        "./vendor/bin/phpstan analyze --configuration=phpstan.core.neon --level=9 " .. input
    )
end

local function _phpstan_choose_type()
    vim.ui.input({ prompt = 'File / Directory to analyze', default = vim.fn.expand('%') }, function(input) _phpstan_toggle(input) end)
end

local function _php_cs_fixer(option, filename)
    require('toggleterm').exec(
        "./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff " .. option .. 'fix ' .. filename
    )
end

local function _php_cs_fixer_fix_toggle()
    vim.ui.input({ prompt = 'File / Directory to fix', default = vim.fn.expand('%') }, function(input) _php_cs_fixer('', input) end)
end

local function _php_cs_fixer_dry_toggle()
    vim.ui.input({ prompt = 'File / Directory to analyze', default = vim.fn.expand('%') }, function(input) _php_cs_fixer('--dry-run', input) end)
end

local function _php_cs_fixer_choose_type()
    __make_choice({'dry-run', 'fix'}, {['dry-run'] = _php_cs_fixer_dry_toggle, ['fix'] = _php_cs_fixer_fix_toggle})
end

local function _docker_cp(source, destination)
    vim.notify('Sync ' .. source .. 'to ' .. destination .. ' on container', 'info', notifyOptions)
    os.execute('docker cp ' .. source .. ' centreon-dev:' .. destination)
end

local function _docker_cp_choose_destination(source)
    vim.ui.input({ prompt = 'Destination on container', default = "/usr/share/centreon" .. vim.fn.expand('%') }, function(input) _docker_cp(source, input) end)
end

local function _docker_cp_choose_source()
    vim.ui.input({ prompt = 'Source to copy on container', default = vim.fn.expand('%') }, function(input) _docker_cp_choose_destination(input) end)
end

local cases = {
    ['phpstan'] = _phpstan_choose_type,
    ['php-cs-fixer'] = _php_cs_fixer_choose_type,
    ['docker-cp'] = _docker_cp_choose_source
}

local choices = {
    'phpstan',
    'php-cs-fixer',
    'docker-cp'
}

local selectDevOptions = function()
    __make_choice(choices, cases)
end

vim.keymap.set('n', '<leader>dev', selectDevOptions)
