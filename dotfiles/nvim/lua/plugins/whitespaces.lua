-- Using packer.nvim
--
local Plugin = { 'johnfrankmorgan/whitespace.nvim' }

function Plugin.config()
    require('whitespace-nvim').setup({
            -- configuration options and their defaults

            -- `highlight` configures which highlight is used to display
            -- trailing whitespace
            highlight = 'DiffDelete',

            -- `ignored_filetypes` configures which filetypes to ignore when
            -- displaying trailing whitespace
            ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard', 'toggleterm' },

            -- `ignore_terminal` configures whether to ignore terminal buffers
            ignore_terminal = true,
        })

        -- remove trailing whitespace with a keybinding
        vim.keymap.set('n', '<Leader>cw', require('whitespace-nvim').trim)
end

return Plugin
