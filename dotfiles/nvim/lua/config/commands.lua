local function __make_choice(choices, actions)
    vim.ui.select(
        choices,
        {
            prompt = "What do you want to do ?",
            telescope = require("telescope.themes").get_ivy(),
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
    vim.ui.input({ prompt = 'File / Directory to analyze', default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _phpstan_toggle(input) end)
end

local function _php_cs_fixer(option, filename)
    require('toggleterm').exec(
        "./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff " .. option .. ' fix ' .. filename
    )
end

local function _pest(filename)
    require('toggleterm').exec(
        "./vendor/bin/pest " .. filename
    )
end

local function _php_cs_fixer_fix_toggle()
    vim.ui.input({ prompt = 'File / Directory to fix', default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _php_cs_fixer('', input) end)
end

local function _php_cs_fixer_dry_toggle()
    vim.ui.input({ prompt = 'File / Directory to analyze', default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _php_cs_fixer('--dry-run', input) end)
end

local function _pest_execute_test()
    vim.ui.input(
        { prompt = 'Test file / Directory to execute', default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _pest(input) end)
end

local function _php_cs_fixer_choose_type()
    __make_choice({ 'dry-run', 'fix' }, { ['dry-run'] = _php_cs_fixer_dry_toggle, ['fix'] = _php_cs_fixer_fix_toggle })
end

local function _docker_cp(source, destination)
    local message = 'Sync ' .. source .. 'to ' .. destination .. ' on container'
    vim.notify(message)
    os.execute('docker cp ' .. source .. ' centreon-dev:' .. destination)
end

local function _docker_cp_choose_destination(source)
    vim.ui.input(
        { prompt = 'Destination on container', default = "/usr/share/centreon/" ..
        vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _docker_cp(source, input) end)
end

local function _docker_cp_choose_source()
    vim.ui.input({ prompt = 'Source to copy on container', default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") },
        function(input) _docker_cp_choose_destination(input) end)
end

local function _docker_enter()
    local Terminal = require('toggleterm.terminal').Terminal
    local enter_container = Terminal:new({
        cmd = 'docker exec -ti $(docker ps -qa) bash',
        direction = 'float',
        close_on_exit = false
    })
    enter_container:toggle()
end

local function _docker_php_clear_cache()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev sudo -u apache /usr/bin/php /usr/share/centreon/bin/console c:c',
        direction = 'horizontal',
        close_on_exit = false
    })
    php_logs:toggle()
end

local function _docker_show_php_logs()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev tail -f /var/log/php-fpm/centreon-error.log',
        direction = 'horizontal',
        close_on_exit = false
    })
    php_logs:toggle()
end

local function _docker_show_engine_logs()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev tail -f /var/log/centreon-engine/centengine.log',
        direction = 'horizontal',
        close_on_exit = false
    })
    php_logs:toggle()
end

local function _docker_show_centreon_web_logs()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev tail -f /var/log/centreon/centreon-web.log',
        direction = 'horizontal',
        close_on_exit = false
    })
    php_logs:toggle()
end

local function _docker_show_sql_logs()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev tail -f /var/log/centreon/sql-error.log',
        direction = 'horizontal',
        close_on_exit = false
    })
    php_logs:toggle()
end

local function _docker_choose_logs()
    __make_choice(
        {
            'centreon-error.log',
            'centreon-web.log',
            'sql-error.log',
            'centengine.log',
        },
        {
            ['centreon-error.log'] = _docker_show_php_logs,
            ['centreon-web.log'] = _docker_show_centreon_web_logs,
            ['sql-error.log'] = _docker_show_sql_logs,
            ['centengine.log'] = _docker_show_engine_logs
        }
    )
end

local function _centreon_database()
    vim.cmd [[ :tabnew | DBUIToggle ]]
end

local cases = {
    ['phpstan'] = _phpstan_choose_type,
    ['php-cs-fixer'] = _php_cs_fixer_choose_type,
    ['pest'] = _pest_execute_test,
    ['docker-cp'] = _docker_cp_choose_source,
    ['docker-enter'] = _docker_enter,
    ['docker-logs'] = _docker_choose_logs,
    ['database'] = _centreon_database,
    ['php-clear-cache'] = _docker_php_clear_cache,
}

local choices = {
    'docker-cp',
    'docker-enter',
    'docker-logs',
    'database',
    'phpstan',
    'pest',
    'php-cs-fixer',
    'php-clear-cache',
}

local devOptions = function()
    __make_choice(choices, cases)
end

vim.keymap.set('n', '<leader>dv', devOptions)

vim.o.confirm = true
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
            vim.cmd("quit") end
    end
})
