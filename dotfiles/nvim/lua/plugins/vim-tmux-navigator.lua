return {
    {
        "christoomey/vim-tmux-navigator",
        init = function ()
            vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
        end
    },
}
