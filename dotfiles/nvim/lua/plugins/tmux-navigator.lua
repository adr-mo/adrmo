local Plugin = {
    "christoomey/vim-tmux-navigator",
}

function Plugin.init()
    vim.g.tmux_navigator_disable_when_zoomed = 1
end

return Plugin
