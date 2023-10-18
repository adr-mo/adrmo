local P = {
    "szw/vim-maximizer",
}

function P.config()
    vim.g.maximizer_set_default_mapping = 0
    vim.g.maximizer_default_mapping_key = ''
    -- keymap to mqximize the curremt split
    vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
end

return P
