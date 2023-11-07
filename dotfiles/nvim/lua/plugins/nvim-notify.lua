local Plugin = {
    'rcarriga/nvim-notify'
}

function Plugin.config()
    local notify = require('notify')
    notify.setup({
        render = 'wrapped-compact',
        stages = 'slide'
    })
    vim.notify = notify
end

return Plugin
