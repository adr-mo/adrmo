local P = {
    "kdheepak/lazygit.nvim",
}

function P.config()
    vim.keymap.set('n', '<leader>g', '<cmd>:LazyGit<cr>')
end

return P
