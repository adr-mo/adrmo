return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "benfowler/telescope-luasnip.nvim",
        'nvim-telescope/telescope-dap.nvim',
    },
    keys = {
        { '<leader>fb',  "<cmd>Telescope buffers <CR>",                                                         desc = "Telescope Buffers" },
        { '<leader>fg',  "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '-j1' }})<CR>", desc = "Telescope live grep" },
        { '<leader>fo',  "<cmd>Telescope oldfiles <CR>",                                                        desc = "Telescope oldfiles" },
        { '<leader>fs',  "<cmd>Telescope lsp_document_symbols ignore_symbols=variable,function<CR>",            desc = "Telescope LSP symbols" },
        { '<leader>ff',  "<cmd>Telescope find_files <CR>",                                                      desc = "Telescope find files" },
        { '<leader>fk',  "<cmd>Telescope keymaps <CR>",                                                         desc = "Telescope keymaps" },
        { '<leader>fc',  "<cmd>Telescope commands <CR>",                                                        desc = "Telescope commands" },
        { '<leader>ft',  "<cmd>Telescope treesitter <CR>",                                                      desc = "Telescope Treesitter" },
        { '<leader>fC',  "<cmd>Telescope colorscheme <CR>",                                                     desc = "Telescope colorscheme" },
        { '<leader>fl',  "<cmd>Telescope luasnip <CR>",                                                         desc = "Telescope luasnip" },
        { '<leader>dap', '<cmd>lua require("telescope").extensions.dap.commands{}<CR>',                         desc = "Telescope dap" },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local action_layout = require("telescope.actions.layout")
        local icons = require("config.icons")

        telescope.load_extension("fzf")
        telescope.load_extension('live_grep_args')
        telescope.load_extension('luasnip')
        telescope.load_extension('dap')
        telescope.setup({
            defaults = {
                prompt_prefix = " " .. icons.ui.Telescope .. " ",
                -- path_display = { truncate = 1 },
                path_display = { "absolute" },
                color_devicons = true,
                selection_caret = icons.ui.ChevronRight .. " ",
                border = true,
                selection_strategy = "reset",
                sorting_strategy = "ascending",

                vimgrep_arguments = {
                    "rg",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--follow",
                    "--smart-case",
                },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                    i = {
                        ["<C-p>"] = action_layout.toggle_preview,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ["<esc>"] = actions.close,
                    },
                },
                file_ignore_patterns = { '.git/', 'node_modules/' },
                -- initial_mode = 'normal',
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.85,
                    height = 0.92,
                    preview_cutoff = 120,
                },
            },
            pickers = {
                buffers = {
                    initial_mode = "normal"
                },
                oldfiles = {
                    initial_mode = "normal"
                },
            },
            extensions = {
            }
        })
    end
}
