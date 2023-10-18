local P = {
    "nvim-lualine/lualine.nvim",
}

function P.config()
    local lualine = require('lualine')
    lualine.setup({
        theme = 'auto',
        disabled_filetypes = { 'NVimTree' },
    })
end

return P
