return {
    {
        'windwp/nvim-autopairs',
        init = function ()
            require('nvim-autopairs').setup()
        end
    },
    {
        "tpope/vim-surround"
    },
    {
        "numToStr/Comment.nvim",
        config = function ()
            require('Comment').setup()
        end
    },
    {
        "karb94/neoscroll.nvim",
        config = function ()
            require('neoscroll').setup()
            require('neoscroll.config').set_mappings({
                ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50' } },
                ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50' } },
            })
        end
    },
    {
        'AndrewRadev/splitjoin.vim',
    }
}
