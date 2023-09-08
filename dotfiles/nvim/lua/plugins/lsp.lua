local options = { noremap = true, silent = true }
vim.keymap.set(
    'n',
    '<leader>df',
    "<cmd>:TermExec direction=float cmd='./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff --dry-run fix %'<cr>"
)

local on_attach = function(client, bufnr)
    vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, options)
    vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, options)
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    vim.keymap.set('n', 'gd', '<cmd>:Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'gr', '<cmd>:Telescope lsp_references<CR>')
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>')

    if client.name == 'intelephense' then
        vim.keymap.set('n', 'gi', '<cmd>:PhpactorGotoImplementations<CR>')
        vim.keymap.set('n', '<Leader>ca', '<cmd>:PhpactorTransform<CR>')
        vim.keymap.set("n", "<Leader>a", '<cmd>:PhpactorContextMenu<CR>', options)
        vim.keymap.set(
            'n',
            '<leader>dfc',
            "<cmd>:! echo \"Fixing coding style issues\" ; ./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --quiet fix %<cr>"
        )
    end
end

local languages = {
    "lua_ls",
    "tsserver",
    "cssls",
    "jsonls",
    "bashls",
    "marksman",
    "intelephense",
    "yamlls"
}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'b0o/schemastore.nvim',
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("lspconfig").lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "describe", "it" },
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
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
                capabilities = capabilities
            })

            for _, language in pairs(languages) do
                require("lspconfig")[language].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end


            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true
                }
            )
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                debug = true,
                sources = {
                    -- PHPStan + php-cs-fixer
                    null_ls.builtins.diagnostics.phpstan.with({    -- Use the local installation first
                        diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
                        only_local = "vendor/bin",
                        command = 'phpstan',
                        args = { "analyze", "--configuration=phpstan.core.neon", "--error-format", "json",
                            "--no-progress", "--level", "max", "$FILENAME" },
                    }),

                    -- Prettier and spelling
                    -- null_ls.builtins.formatting.prettierd,
                    -- null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
                }
            })
        end
    },
    {
        "jayp0521/mason-null-ls.nvim",
        config = function()
            require('mason-null-ls').setup({
                automatic_installation = true,
            })
        end
    },
    {
        "phpactor/phpactor",
        run = 'composer install --no-dev -o'
    }
}
