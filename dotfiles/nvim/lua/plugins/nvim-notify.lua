local P = {
    'rcarriga/nvim-notify',
}

function P.config()
    local notify = require('notify')
    notify.setup({
        render = 'wrapped-compact',
        stages = 'slide'
    })
    vim.notify = notify
end

return P
