return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
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
            vim.keymap.set('n', '<leader>fr', "<cmd>lua require('telescope.builtin').buffers()<CR>")
            vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
            vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
            vim.keymap.set('n', '<leader>fs', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>")
            vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>")
            vim.keymap.set("n", "<leader>fC", "<cmd>Telescope colorscheme<cr>")
            vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip<cr>")
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>")
        end,
        config = function ()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local fb_actions = require("telescope._extensions.file_browser.actions")
            telescope.load_extension("media_files")
            telescope.load_extension("fzf")
            telescope.load_extension('live_grep_args')
            telescope.load_extension('luasnip')
            telescope.load_extension('file_browser')

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
                    },
                },
                extensions = {
                    file_browser = {
                        -- path
                        -- cwd
                        cwd_to_path = false,
                        grouped = false,
                        files = true,
                        add_dirs = true,
                        depth = 1,
                        auto_depth = false,
                        select_buffer = false,
                        hidden = { file_browser = false, folder_browser = false },
                        -- respect_gitignore
                        -- browse_files
                        -- browse_folders
                        hide_parent_dir = false,
                        collapse_dirs = false,
                        prompt_path = false,
                        quiet = false,
                        dir_icon = "",
                        dir_icon_hl = "Default",
                        display_stat = { date = true, size = true, mode = true },
                        hijack_netrw = false,
                        use_fd = true,
                        git_status = true,
                        mappings = {
                            ["i"] = {
                                ["<A-c>"] = fb_actions.create,
                                ["<S-CR>"] = fb_actions.create_from_prompt,
                                ["<A-r>"] = fb_actions.rename,
                                ["<A-m>"] = fb_actions.move,
                                ["<A-y>"] = fb_actions.copy,
                                ["<A-d>"] = fb_actions.remove,
                                ["<C-o>"] = fb_actions.open,
                                ["<C-g>"] = fb_actions.goto_parent_dir,
                                ["<C-e>"] = fb_actions.goto_home_dir,
                                ["<C-w>"] = fb_actions.goto_cwd,
                                ["<C-t>"] = fb_actions.change_cwd,
                                ["<C-f>"] = fb_actions.toggle_browser,
                                ["<C-h>"] = fb_actions.toggle_hidden,
                                ["<C-s>"] = fb_actions.toggle_all,
                                ["<bs>"] = fb_actions.backspace,
                            },
                            ["n"] = {
                                ["c"] = fb_actions.create,
                                ["r"] = fb_actions.rename,
                                ["m"] = fb_actions.move,
                                ["y"] = fb_actions.copy,
                                ["d"] = fb_actions.remove,
                                ["o"] = fb_actions.open,
                                ["g"] = fb_actions.goto_parent_dir,
                                ["e"] = fb_actions.goto_home_dir,
                                ["w"] = fb_actions.goto_cwd,
                                ["t"] = fb_actions.change_cwd,
                                ["f"] = fb_actions.toggle_browser,
                                ["h"] = fb_actions.toggle_hidden,
                                ["s"] = fb_actions.toggle_all,
                            },
                        },
                    },
                },
            })
        end,
    }
}
