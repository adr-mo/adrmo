local P = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-buffer',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        {
            'kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql', 'plsql' },
            lazy = true
        }
    }
}

function P.config()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local icons = require('config.icons')

    luasnip.setup({
        keys = function()
            return {}
        end,
    })

    local border = function(hl)
        return {
            { '╭', hl },
            { '─', hl },
            { '╮', hl },
            { '│', hl },
            { '╯', hl },
            { '─', hl },
            { '╰', hl },
            { '│', hl },
        }
    end

    cmp.setup {
        completion = {
            -- Disable the completion menu, you must invoke it with <c-space>
            -- autocomplete = false,
            completeopt = 'menu,menuone,longest,preview,noinsert,noselect'
        },

        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- Luasnip expand
            end
        },

        mapping = cmp.mapping.preset.insert {
            -- Scroll text in documentation window
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            -- toggle completion
            ['<C-Space>'] = cmp.mapping(function() if cmp.visible() then cmp.abort() else cmp.complete() end end),
            -- navigate completion entries with TAB
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end),
            ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) == 1 then
                    luasnip.jump(-1)
                end
            end),
            -- Jump to the next placeholder in the snippet.
            ['<C-f>'] = cmp.mapping(function(fallback) if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end end),
            -- go to previous placeholder in the snippet
            ['<C-b>'] = cmp.mapping(function(fallback) if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },                -- LSP
            { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
            { name = 'luasnip' },                 -- Luasnip
            { name = 'buffer' },
            { name = 'nvim_lua' },                -- Lua Neovim API
            { name = 'path' },                    -- Paths
        }),

        formatting = {
            fields = { 'abbr', 'kind', 'menu' },

            format = lspkind.cmp_format {
                -- defines how annotations are shown
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = 'text_symbol',
                maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                -- symbol map, defaults or codicons
                -- preset = 'codicons',

                menu = {
                    nvim_lsp = icons.lsp.Lsp,
                    luasnip = icons.lsp.Luasnip,
                    buffer = icons.lsp.Buffer,
                    path = icons.lsp.Path,
                    nvim_lua = icons.lsp.Lua,
                }
            }
        },

        window = {
            completion = {
                border = border("PmenuBorder"),
                winhighlight = "Normal:CmpDoc,CursorLine:PmenuSel,Search:PmenuSel",
                -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
                scrollbar = true,
            },
            documentation = {
                border = border("CmpDocBorder"),
                winhighlight = "Normal:CmpDoc",
            },
        },

        -- experimental = {
        --     ghost_text = {
        --         hl_group = "CmpItemKindKeyword",
        --     },
        -- }
    }

    -- Use buffer source for `/` and `?` (don't enable `native_menu`, otherwise this won't work).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (don't enable `native_menu`, otherwise this won't work).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline {
            ['<C-y>'] = {
                c = cmp.mapping.close(), --avoids ghost text behavior with noice
            },
        },
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
    })

    -- Add snippets from Friendly Snippets
    require('luasnip/loaders/from_vscode').lazy_load()
end

return P
