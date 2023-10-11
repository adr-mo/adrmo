return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        config = function()
            local lspkind = require("lspkind")
            local cmp = require("cmp")
            local luasnip = require("luasnip")


            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if not cmp.confirm(option) then
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        elseif cmp.visible() then
                            cmp.select_next_item()
                            -- elseif has_words_before() then
                            --     cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        elseif cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'nvim_lua' },
                    { name = 'nvim_lsp_signature_help' },
                }),
                enabled = function()
                    -- disable completion in comments
                    local context = require 'cmp.config.context'

                    -- keep command mode completion enabled
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                    else
                        return not context.in_treesitter_capture("comment")
                            and not context.in_syntax_group("Comment")
                    end
                end,
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol",
                        maxwidth = 50,
                        ellipsis_char = '...',
                        menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            buffer = "[Buffer]",
                            nvim_lua = "[Lua]",
                            nvim_lsp_signature_help = "[LSPSignature]",
                            ['database'] = '[Database]'
                        })
                    }),
                },
                view = {
                    entries = { name = "custom", selection_order = "near_cursor" },
                },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } },
                    { { name = "cmdline" } })
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
}
