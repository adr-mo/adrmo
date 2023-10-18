local P = {
    'norcalli/nvim-colorizer.lua',
}

function P.config()
    local colorizer = require('colorizer').setup({})
    colorizer.setup({})
end

return P
