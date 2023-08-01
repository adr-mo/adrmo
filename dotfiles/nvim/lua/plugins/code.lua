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
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
       keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    {
        'jubnzv/virtual-types.nvim',
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}
