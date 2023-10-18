local P = {
    "j-hui/fidget.nvim",
    tag = 'legacy',
}

function P.config()
    require('fidget').setup({
        window = {
            blend = 0,
        },
    })
end

return P
