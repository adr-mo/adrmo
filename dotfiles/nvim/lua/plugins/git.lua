return {
    {
        "kdheepak/lazygit.nvim",
        init = function ()
            vim.keymap.set('n', '<leader>g', '<cmd>:LazyGit<cr>')
        end
    },
    { "lewis6991/gitsigns.nvim" }
}