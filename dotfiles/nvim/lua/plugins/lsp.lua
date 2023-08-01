local options = { noremap=true, silent=true }
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, options)
vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, options)

local on_attach = function (client, bufnr)
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    vim.keymap.set('n', 'gd', '<cmd>:Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'gr', '<cmd>:Telescope lsp_references<CR>')
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    if client.name == 'intelephense' then
        vim.keymap.set('n', 'gi', '<cmd>:PhpactorGotoImplementations<CR>')
        vim.keymap.set('n', '<Leader>ca', '<cmd>:PhpactorTransform<CR>')
    end
end

local languages = {
    "lua_ls",
    "tsserver",
    "cssls",
    "jsonls",
    "bashls",
    "marksman",
    "intelephense"
}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp", 'b0o/schemastore.nvim' },
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

            require('lspconfig').jsonls.setup({
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                    },
                },
            })

            require('lspconfig').intelephense.setup({ capabilities = capabilities })

            for _, language in pairs(languages) do
                require("lspconfig")[language].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end


            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false
                }
            )
        end
    },
    {
        "williamboman/mason.nvim",
        config = function ()
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
        config = function ()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    -- Eslint
                    null_ls.builtins.code_actions.eslint_d,
                    null_ls.builtins.formatting.eslint_d.with({
                        condition = function(utils)
                            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
                        end,
                    }),
                    null_ls.builtins.diagnostics.eslint_d.with({
                        condition = function(utils)
                            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
                        end,
                    }),

                    -- Markdown.
                    null_ls.builtins.formatting.markdownlint,
                    null_ls.builtins.diagnostics.markdownlint.with({
                        extra_args = { "--disable", "line-length" },
                    }),

                    -- PhpCs and PhpCbf
                    null_ls.builtins.diagnostics.phpstan.with({ -- Use the local installation first
                        diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
                        only_local = "vendor/bin",
                        args = { "analyze", "--level", "max", "$FILENAME" }
                    }),
                    null_ls.builtins.formatting.phpcsfixer.with({
                        prefer_local = "vendor/bin",
                    }),

                    -- Prettier and spelling
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
                }
            })
        end
    },
    {
        "jayp0521/mason-null-ls.nvim",
        config = function ()
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
