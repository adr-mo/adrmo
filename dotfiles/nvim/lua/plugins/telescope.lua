local P = {
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
        "aaronhallaert/advanced-git-search.nvim",
        "lpoto/telescope-docker.nvim",
        'nvim-telescope/telescope-dap.nvim',
        'LukasPietzschmann/telescope-tabs',
    }
}

function P.config()
    vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers <CR>")
    vim.keymap.set('n', '<leader>fg',
        "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '-j1' }})<CR>")
    vim.keymap.set('n', '<leader>fh', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
    vim.keymap.set('n', '<leader>fs',
        "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>")
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files <CR>')
    vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps <cr>")
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands <cr>")
    vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter <cr>")
    vim.keymap.set("n", "<leader>fC", "<cmd>Telescope colorscheme <cr>")
    vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip <cr>")
    vim.keymap.set("n", "<leader>fG", "<cmd>Telescope gh pull_request <cr>")
    vim.keymap.set('n', '<leader>fi', '<cmd>AdvancedGitSearch<CR>', { desc = "AdvancedGitSearch" })
    vim.keymap.set('n', '<leader>dk', '<cmd>Telescope docker<CR>', { desc = 'Docker' })
    vim.keymap.set("n", "<leader>dap", '<cmd>lua require("telescope").extensions.dap.commands{}<CR>',
        { desc = 'Dap' })

    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.load_extension("media_files")
    telescope.load_extension("fzf")
    telescope.load_extension('live_grep_args')
    telescope.load_extension('luasnip')
    telescope.load_extension('gh')
    telescope.load_extension('advanced_git_search')
    telescope.load_extension('docker')
    telescope.load_extension('dap')

    telescope.setup({
        defaults = {
            prompt_prefix = '   ',
            path_display = { truncate = 1 },
            selection_caret = '  ',
            border = true,
            layout_config = {
                prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
            mappings = {
                i = {
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-d>'] = actions.delete_buffer,
                    ["<esc>"] = actions.close
                },
            },
            file_ignore_patterns = { '.git/', 'node_modules/' },
        },
        pickers = {
            find_files = {
                theme = 'dropdown',
                prompt_title = 'Find files',
                hidden = true,
                previewer = false,
                layout_config = {
                    width = 0.6,
                },
            },
            buffers = {
                theme = 'dropdown',
                prompt_title = 'Opened files',
                hidden = true,
                previewer = false,
                layout_config = {
                    width = 0.6,
                },
                mappings = {
                    i = {
                        ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                    }
                }
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
                previewer = false
            },
        },
        extensions = {
            -- NOTE: this setup is optional
            docker = {
                -- These are the default values
                theme = "dropdown",
                binary = "docker",         -- in case you want to use podman or something
                compose_binary = "docker compose",
                buildx_binary = "docker buildx",
                machine_binary = "docker-machine",
                log_level = vim.log.levels.INFO,
                init_term = "tabnew",         -- "vsplit new", "split new", ...
            },
        },
    })
end

return P
