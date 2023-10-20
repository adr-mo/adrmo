local P = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/nvim-cmp'
    }
}

function P.config()
    local p = require('nvim-autopairs')
    p.setup({
        check_ts = true
    })

    require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
end

return P
