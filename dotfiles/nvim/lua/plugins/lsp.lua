table.unpack = table.unpack or unpack

local on_attach = function()
    local options = { noremap = true, silent = true }

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', options)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, options)
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', {table.unpack(options), desc = 'Go to implementation'})
    vim.keymap.set('n', '[d', '<cmd>vim.diagnostic.goto_prev<CR>')
    vim.keymap.set('n', ']d', '<cmd>vim.diagnostic.goto_next<CR>')
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>')
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, options)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, options)
end

local languages = {
    'lua_ls',
    'tsserver',
    'cssls',
    'jsonls',
    'bashls',
    'marksman',
    'intelephense',
    'yamlls',
    'sqlls'
}

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'b0o/schemastore.nvim',
        },
        config = function()
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = 'rounded'
                }
            )
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = 'rounded'
                }
            )
            vim.diagnostic.config {
                float = { border = 'rounded' }
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('lspconfig').lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim', 'describe', 'it' },
                        },
                    },
                },
            })

            require('lspconfig').yamlls.setup({
                capabilities = capabilities,
                settings = {
                    yaml = {
                        schemastore = {
                            enable = false,
                            url = '',
                        },
                        schemas = require('schemastore').yaml.schemas(),
                    }
                }
            })

            require('lspconfig').jsonls.setup({
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true }
                    },
                },
            })

            require('lspconfig').intelephense.setup({
                commands = {
                    IntelephenseIndex = {
                        function()
                            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
                        end,
                    },
                },
                on_attach = on_attach,
                capabilities = capabilities
            })

            for _, language in pairs(languages) do
                require('lspconfig')[language].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true
                }
            )
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = {
                    border = 'rounded',
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = languages
            })
        end
    },
}
