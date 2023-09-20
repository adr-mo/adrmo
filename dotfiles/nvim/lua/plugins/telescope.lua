return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-github.nvim",
            "tpope/vim-fugitive",
            'tpope/vim-rhubarb',
            "aaronhallaert/advanced-git-search.nvim"
        },
        init = function()
            vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers <CR>")
            vim.keymap.set('n', '<leader>fg',
                "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '-j1' }})<CR>")
            vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
            vim.keymap.set('n', '<leader>fs',
                "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>")
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files <CR>')
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps <cr>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands <cr>")
            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects <cr>")
            vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter <cr>")
            vim.keymap.set("n", "<leader>fC", "<cmd>Telescope colorscheme <cr>")
            vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip <cr>")
            vim.keymap.set("n", "<leader>fG", "<cmd>Telescope gh pull_request <cr>")
            vim.keymap.set('n', '<leader>fi', '<cmd>AdvancedGitSearch<CR>', { desc = "AdvancedGitSearch" })
        end,
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            telescope.load_extension("media_files")
            telescope.load_extension("fzf")
            telescope.load_extension('live_grep_args')
            telescope.load_extension('luasnip')
            telescope.load_extension('gh')
            telescope.load_extension('advanced_git_search')

            telescope.setup({
                defaults = {
                    prompt_prefix = '   ',
                    path_display = { truncate = 1 },
                    selection_caret = '  ',
                    layout_config = {
                        prompt_position = 'top',
                    },
                   sorting_strategy = 'ascending',
                    mappings = {
                        i = {
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-d>'] = actions.delete_buffer
                        },
                    },
                    pickers = {
                        find_files = {
                            hidden = true,
                        },
                        buffers = {
                            previewer = false,
                            layout_config = {
                                width = 80,
                            },
                        },
                        oldfiles = {
                            prompt_title = 'History',
                        },
                        lsp_references = {
                            previewer = false,
                        },
                        lsp_definitions = {
                            previewer = false,
                        },
                        lsp_document_symbols = {
                            symbol_width = 55,
                        },
                    },
                    file_ignore_patterns = { '.git/', 'vendor/', 'node_modules/' },
                },
            })
        end,
    }
}
