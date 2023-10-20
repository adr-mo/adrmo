local P = {
    "christoomey/vim-tmux-navigator",
}

function P.init()
    vim.g.tmux_navigator_disable_when_zoomed = 1
end

return P
