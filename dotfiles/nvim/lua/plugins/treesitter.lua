return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require('nvim-treesitter.configs').setup({
                -- enable syntax highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                context_commentstring = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['if'] = '@function.inner',
                            ['af'] = '@function.outer',
                            ['ia'] = '@parameter.inner',
                            ['aa'] = '@parameter.outer',
                        },
                    }
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>",
                        node_incremental = "<leader>",
                    },
                },
                -- ensure these language parsers are installed
                ensure_installed = 'all', 
                -- auto install above language parsers
                auto_install = true,
            })
        end,
    },
}
