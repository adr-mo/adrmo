return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-github.nvim",
        },
        init = function ()
            vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers theme=ivy<CR>")
            vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_ivy({}))<CR>")
            vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_ivy({}))<CR>")
            vim.keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>")
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files theme=ivy<CR>')
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps theme=ivy<cr>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands theme=ivy<cr>")
            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects theme=ivy<cr>")
            vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter theme=ivy<cr>")
            vim.keymap.set("n", "<leader>fC", "<cmd>Telescope colorscheme theme=ivy<cr>")
            vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip theme=ivy<cr>")
            vim.keymap.set("n", "<leader>fG", "<cmd>Telescope gh pull_request theme=ivy<cr>")
        end,
        config = function ()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            telescope.load_extension("media_files")
            telescope.load_extension("fzf")
            telescope.load_extension('live_grep_args')
            telescope.load_extension('luasnip')
            telescope.load_extension('gh')

            telescope.setup({
                defaults = {
                    prompt_prefix = '   ',
                    path_display = {'smart'},
                    selection_caret = '  ',
                    layout_config = {
                        prompt_position = 'top',
                    },
                    sorting_strategy = 'ascending',
                    mappings = {
                        i = {
                            -- ['<esc>'] = actions.close,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-d>'] = actions.delete_buffer
                        },
                    },
                    file_ignore_patterns = { '.git/', 'vendor/', 'node_modules/' },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        prompt_title = 'Find files',
                        prompt_prefix = ' 󰱼 ',
                        hidden = true,
                        previewer = false,
                        layout_config = {
                            prompt_position = 'bottom'
                        }
                    },
                    buffers = {
                        theme = "dropdown",
                        prompt_title = 'Opened files',
                        prompt_prefix = '  ',
                        hidden = true,
                        previewer = false,
                        layout_config = {
                            prompt_position = 'bottom'
                        }
                    },
                    oldfiles = {
                        theme = "dropdown",
                        prompt_title = 'Recent Files',
                        prompt_prefix = ' 󰙰 ',
                        hidden = true,
                        previewer = false,
                        layout_config = {
                            prompt_position = 'bottom'
                        }
                    },
                    lsp_references = {
                        previewer = false,
                    },
                    live_grep = {
                        prompt_title = 'search in files',
                        prompt_prefix = ' 󱎸 ',
                        previewer = false
                    },
                },
                extensions = {
                    live_grep_args = {
                        prompt_title = 'search in files',
                        prompt_prefix = ' 󱎸 ',
                        previewer = false
                    },
                },
            })
        end,
    }
}
