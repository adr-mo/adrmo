return {
    "gbprod/phpactor.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required to update phpactor
        "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
    },
    config = function()
        require("phpactor").setup({
            install = {
                -- path = vim.fn.stdpath("data") .. "/opt/",
                -- branch = "master",
                -- bin = vim.fn.stdpath("data") .. "/opt/phpactor/bin/phpactor",
                bin = "/Users/Adrien/.local/bin/phpactor",
                php_bin = "php",
                composer_bin = "composer",
                git_bin = "git",
                check_on_startup = "none",
            },
            lspconfig = {
                enabled = false,
                options = {},
            },
        })
    end
}
