local P = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
}

function P.config()
    local p = require('nvim-autopairs')
    p.setup({})
end

return P
