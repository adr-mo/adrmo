return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        -- init = function ()
        --     vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
        --     vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})<cr>")
        --     vim.keymap.set("n", "<leader>fF", "<cmd>Telescope live_grep<cr>")
        --     vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>")
        --     vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>")
        --     vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
        --     vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
        -- end,
        init = function ()
            vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
            vim.keymap.set('n', '<leader>fF', "<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>")
            vim.keymap.set('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
            vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
            vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
            vim.keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
            vim.keymap.set("n", "<leader>fR", "<cmd>Telescope registers<cr>")
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
            vim.keymap.set("n", "<leader>fC", "<cmd>Telescope commands<cr>")
            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>")
            vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>")
        end,
        config = function ()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            telescope.load_extension("media_files")
            telescope.load_extension("fzf")
            telescope.load_extension('live_grep_args')

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
                            ['<esc>'] = actions.close,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-j>'] = actions.move_selection_next,
                        },
                    },
                    file_ignore_patterns = { '.git/', 'vendor/', 'node_modules/' },
                },
                pickers = {
                    find_files = {
                        prompt_title = 'Find files',
                        prompt_prefix = ' 󰱼 ',
                        hidden = true,
                    },
                    buffers = {
                        prompt_title = 'Opened files',
                        prompt_prefix = '  '
                    },
                    oldfiles = {
                        prompt_title = 'Recent Files',
                        prompt_prefix = ' 󰙰 '
                    },
                    lsp_references = {
                        previewer = false,
                    },
                    live_grep = {
                        prompt_title = 'Search in files',
                        prompt_prefix = ' 󱎸 '
                    }
                },
            })
        end,
    }
}
